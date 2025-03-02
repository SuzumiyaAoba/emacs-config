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
      self,
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
        pkgs = import nixpkgs {
          inherit system overlays;

          config = {
            allowUnfree = true;
          };
        };
        initDirectory = "$HOME/.local/share/emacs/SuzumiyaAoba";

        # Emacsパッケージを設定
        emacsPackage = pkgs.emacsWithPackagesFromUsePackage {
          package = pkgs.emacs-unstable;
          config = ./config.org;
          extraEmacsPackages = import ./packages.nix { };
          override = epkgs: import ./epkgs { inherit pkgs epkgs; };
        };

        # 設定ファイルを tangle して .emacs.d を作成する derivation
        emacsConfig = pkgs.stdenv.mkDerivation {
          name = "emacs-config";
          src = ./.;
          dontFixup = true;

          buildInputs = [
            pkgs.emacs-unstable
          ];
          buildPhase = ''
            emacs --batch \
              --eval "(require 'org)" \
              --eval "(org-babel-tangle-file \"config.org\")"
          '';

          installPhase = ''
            mkdir -p $out/.emacs.d
            mv init.el $out/.emacs.d/
            mv early-init.el $out/.emacs.d/
          '';
        };

        # Emacsの起動スクリプト（設定ディレクトリを指定）
        wrappedEmacs = pkgs.writeScriptBin "emacs" ''
          #!${pkgs.bash}/bin/bash

          if [ ! -e "${initDirectory}" ]; then
            mkdir -p "${initDirectory}"
          fi

          ln -sf "${emacsConfig}/.emacs.d/init.el"       "${initDirectory}/init.el"
          ln -sf "${emacsConfig}/.emacs.d/early-init.el" "${initDirectory}/early-init.el"

          exec ${emacsPackage}/bin/emacs \
            --init-directory="${initDirectory}" \
            "$@"
        '';

        editorScript = pkgs.writeShellScriptBin "emacseditor" ''
          if [ -z "$1" ]; then
            exec ${emacsPackage}/bin/emacsclient --create-frame --alternate-editor ${emacsPackage}/bin/emacs
          else
            exec ${emacsPackage}/bin/emacsclient --alternate-editor ${emacsPackage}/bin/emacs "$@"
          fi
        '';
      in
      {
        packages.default = wrappedEmacs;
        packages.emacsclient = editorScript;

        allowUnfree = true;

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
