{
  description = "SuzumiyaAoba's Emacs configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    nvfetcher.url = "github:berberman/nvfetcher";
    nvfetcher.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      emacs-overlay,
      nvfetcher,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        overlays = [ emacs-overlay.overlay ];
        pkgs = import nixpkgs { inherit system overlays; };
        initDirectory = "$HOME/.local/share/emacs/SuzumiyaAoba";

        # Emacsパッケージを設定
        emacsPackage = pkgs.emacsWithPackagesFromUsePackage {
          package = pkgs.emacs-unstable;
          config = ./config.org;
          extraEmacsPackages =
            epkgs: with epkgs; [
              consult
              magit
              nix-mode
              setup
            ];
          override = import ./epkgs { inherit pkgs; };
        };

        # 設定ファイルを tangle して .emacs.d を作成する derivation
        emacsConfig = pkgs.stdenv.mkDerivation {
          name = "emacs-config";
          src = ./.;
          buildInputs = [
            pkgs.emacs-unstable
          ];
          buildPhase = ''
            mkdir -p $out/.emacs.d

            # config.org を tangle
            emacs --batch \
              --eval "(require 'org)" \
              --eval "(org-babel-tangle-file \"config.org\")"

            mv init.el $out/.emacs.d/
            mv early-init.el $out/.emacs.d/
          '';
          dontInstall = true;
          dontFixup = true;
        };

        # Emacsの起動スクリプト（設定ディレクトリを指定）
        wrappedEmacs = pkgs.writeScriptBin "emacs" ''
          #!${pkgs.bash}/bin/bash

          if [ ! -e "${initDirectory}" ]; then
            mkdir -p "${initDirectory}"
          fi

          if [ ! -e "${initDirectory}/init.el" ]; then
            ln -sf "${emacsConfig}/.emacs.d/init.el"       "${initDirectory}/init.el"
          fi
          if [ ! -e "${initDirectory}/early-init.el" ]; then
            ln -sf "${emacsConfig}/.emacs.d/early-init.el" "${initDirectory}/early-init.el"
          fi

          exec ${emacsPackage}/bin/emacs \
            --init-directory="${initDirectory}" \
            "$@"
        '';
      in
      {
        packages.default = wrappedEmacs;

        # nvfetcherのアップデートコマンドを追加
        apps.update = {
          type = "app";
          program = toString (
            pkgs.writeShellScript "update" ''
              ${nvfetcher.packages.${system}.default}/bin/nvfetcher
            ''
          );
        };
      }
    );
}
