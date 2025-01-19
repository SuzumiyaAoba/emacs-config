{
  description = "SuzumiyaAoba's Emacs configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
  };

  outputs =
    { nixpkgs, flake-utils, emacs-overlay, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        overlays = [ emacs-overlay.overlay ];
        pkgs = import nixpkgs { inherit system overlays; };

        # Emacsパッケージを設定
        emacsPackage = pkgs.emacsWithPackagesFromUsePackage {
          package = pkgs.emacs-unstable;
          config = ./config.org;
          extraEmacsPackages = epkgs: with epkgs; [
            nix-mode
          ];
        };

        # 設定ファイルを tangle して .emacs.d を作成する derivation
        emacsConfig = pkgs.stdenv.mkDerivation {
          name = "emacs-config";
          src = ./.;

          buildInputs = [ pkgs.emacs-unstable ];

          buildPhase = ''
            # .emacs.dディレクトリを作成
            mkdir -p $out/.emacs.d

            # config.orgをtangle
            emacs --batch \
              --eval "(require 'org)" \
              --eval "(org-babel-tangle-file \"config.org\")"

            # 生成されたファイルを.emacs.dに移動
            mv init.el $out/.emacs.d/
            mv early-init.el $out/.emacs.d/
          '';

          dontInstall = true;
          dontFixup = true;
        };

        # Emacsの起動スクリプト
        wrappedEmacs = pkgs.writeScriptBin "emacs" ''
          #!${pkgs.bash}/bin/bash
          exec ${emacsPackage}/bin/emacs \
            --init-directory="${emacsConfig}/.emacs.d" \
            "$@"
        '';
      in
        {
          packages.default = wrappedEmacs;
        }
    );
}
