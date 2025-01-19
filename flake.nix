{
  description = "SuzumiyaAoba's Emacs configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    nvfetcher.url = "github:berberman/nvfetcher";
    nvfetcher.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { nixpkgs, flake-utils, emacs-overlay, nvfetcher, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        overlays = [ emacs-overlay.overlay ];
        pkgs = import nixpkgs { inherit system overlays; };

        # nvfetcherの設定を追加
        sources = pkgs.callPackage ./_sources/generated.nix {};

        # Emacsパッケージを設定
        emacsPackage = pkgs.emacsWithPackagesFromUsePackage {
          package = pkgs.emacs-unstable;
          config = ./config.org;
          extraEmacsPackages = epkgs: with epkgs; [
            seq
            compat
            dash
            transient
            with-editor
            magit
          ];
          override = self: super: {
            seq = self.trivialBuild {
              pname = "seq";
              version = sources.seq.version;
              src = sources.seq.src;
              installPhase = ''
                mkdir -p $out/share/emacs/site-lisp
                cp *.el *.elc $out/share/emacs/site-lisp/
              '';
            };

            compat = self.trivialBuild {
              pname = "compat";
              version = sources.compat.version;
              src = sources.compat.src;
              packageRequires = with self; [ seq ];
              installPhase = ''
                mkdir -p $out/share/emacs/site-lisp
                cp *.el *.elc $out/share/emacs/site-lisp/
              '';
            };

            dash = self.trivialBuild {
              pname = "dash";
              version = sources.dash.version;
              src = sources.dash.src;
              installPhase = ''
                mkdir -p $out/share/emacs/site-lisp
                cp *.el *.elc $out/share/emacs/site-lisp/
              '';
            };

            transient = self.trivialBuild {
              pname = "transient";
              version = sources.transient.version;
              src = sources.transient.src;
              packageRequires = with self; [ compat ];
              buildInputs = with pkgs; [
                texlive.combined.scheme-basic
                texinfo
              ];
              buildPhase = ''
                cd lisp
                make
                cd ..
              '';
              installPhase = ''
                mkdir -p $out/share/emacs/site-lisp
                cp lisp/*.el lisp/*.elc $out/share/emacs/site-lisp/
              '';
            };

            with-editor = self.trivialBuild {
              pname = "with-editor";
              version = sources.with-editor.version;
              src = sources.with-editor.src;
              packageRequires = with self; [ compat ];
              buildPhase = ''
                make lisp
              '';
              installPhase = ''
                mkdir -p $out/share/emacs/site-lisp
                cp lisp/*.el lisp/*.elc $out/share/emacs/site-lisp/
              '';
            };

            magit = self.trivialBuild {
              pname = "magit";
              version = sources.magit.version;
              src = sources.magit.src;
              packageRequires = with self; [ dash transient with-editor ];
              buildInputs = [ pkgs.git ];
              buildPhase = ''
                cd lisp
                make lisp
                cd ..
              '';
              installPhase = ''
                mkdir -p $out/share/emacs/site-lisp
                cp lisp/*.el lisp/*.elc $out/share/emacs/site-lisp/
              '';
            };
          };
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

        # Emacsの起動スクリプト
        wrappedEmacs = pkgs.writeScriptBin "emacs" ''
          #!${pkgs.bash}/bin/bash

          # ネイティブコンパイル用のディレクトリを設定
          XDG_DATA_HOME="$HOME/.local/share"
          EMACS_DIR="$XDG_DATA_HOME/emacs/SuzumiyaAoba"

          mkdir -p $EMACS_DIR

          ln -sf ${emacsConfig}/.emacs.d/init.el       $EMACS_DIR/init.el
          ln -sf ${emacsConfig}/.emacs.d/early-init.el $EMACS_DIR/early-init.el

          export EMACS_NATIVE_COMP_DIR="$EMACS_DIR/eln-cache"

          exec ${emacsPackage}/bin/emacs \
            --init-directory="$EMACS_DIR" \
            "$@"
        '';
      in
        {
          packages.default = wrappedEmacs;

          # nvfetcherのアップデートコマンドを追加
          apps.update = {
            type = "app";
            program = toString (pkgs.writeShellScript "update" ''
              ${nvfetcher.packages.${system}.default}/bin/nvfetcher
            '');
          };
        }
    );
}
