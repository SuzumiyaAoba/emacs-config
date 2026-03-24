{
  description = "Minimal emacs-batteries based Emacs configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    packlet = {
      url = "github:SuzumiyaAoba/packlet?ref=master";
      flake = false;
    };
    emacs-batteries = {
      url = "github:SuzumiyaAoba/emacs-batteries?ref=master";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      emacs-overlay,
      packlet,
      emacs-batteries,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ emacs-overlay.overlay ];
        };
        emacs = pkgs.emacs-unstable;
        epkgs = pkgs.emacsPackagesFor emacs;
        sharedLibraryExt = pkgs.stdenv.hostPlatform.extensions.sharedLibrary;
        emacsWithPackages = epkgs.emacsWithPackages (
          epkgs': with epkgs'; [
            cape
            catppuccin-theme
            consult
            consult-ghq
            corfu
            corfu-prescient
            corfu-terminal
            ddskk
            git-gutter
            git-modes
            magit
            marginalia
            markdown-mode
            mlscroll
            minions
            nerd-icons
            nerd-icons-corfu
            nerd-icons-dired
            nix-mode
            moody
            org-modern
            orderless
            projectile
            prescient
            rainbow-delimiters
            undohist
            vertico
            vundo
          ]
        );
        treeSitterGrammars = pkgs.linkFarm "emacs-tree-sitter-grammars" [
          {
            name = "libtree-sitter-bash${sharedLibraryExt}";
            path = "${pkgs.tree-sitter-grammars.tree-sitter-bash}/parser";
          }
          {
            name = "libtree-sitter-c${sharedLibraryExt}";
            path = "${pkgs.tree-sitter-grammars.tree-sitter-c}/parser";
          }
          {
            name = "libtree-sitter-cmake${sharedLibraryExt}";
            path = "${pkgs.tree-sitter-grammars.tree-sitter-cmake}/parser";
          }
          {
            name = "libtree-sitter-cpp${sharedLibraryExt}";
            path = "${pkgs.tree-sitter-grammars.tree-sitter-cpp}/parser";
          }
          {
            name = "libtree-sitter-css${sharedLibraryExt}";
            path = "${pkgs.tree-sitter-grammars.tree-sitter-css}/parser";
          }
          {
            name = "libtree-sitter-dockerfile${sharedLibraryExt}";
            path = "${pkgs.tree-sitter-grammars.tree-sitter-dockerfile}/parser";
          }
          {
            name = "libtree-sitter-go${sharedLibraryExt}";
            path = "${pkgs.tree-sitter-grammars.tree-sitter-go}/parser";
          }
          {
            name = "libtree-sitter-html${sharedLibraryExt}";
            path = "${pkgs.tree-sitter-grammars.tree-sitter-html}/parser";
          }
          {
            name = "libtree-sitter-java${sharedLibraryExt}";
            path = "${pkgs.tree-sitter-grammars.tree-sitter-java}/parser";
          }
          {
            name = "libtree-sitter-javascript${sharedLibraryExt}";
            path = "${pkgs.tree-sitter-grammars.tree-sitter-javascript}/parser";
          }
          {
            name = "libtree-sitter-json${sharedLibraryExt}";
            path = "${pkgs.tree-sitter-grammars.tree-sitter-json}/parser";
          }
          {
            name = "libtree-sitter-python${sharedLibraryExt}";
            path = "${pkgs.tree-sitter-grammars.tree-sitter-python}/parser";
          }
          {
            name = "libtree-sitter-rust${sharedLibraryExt}";
            path = "${pkgs.tree-sitter-grammars.tree-sitter-rust}/parser";
          }
          {
            name = "libtree-sitter-toml${sharedLibraryExt}";
            path = "${pkgs.tree-sitter-grammars.tree-sitter-toml}/parser";
          }
          {
            name = "libtree-sitter-tsx${sharedLibraryExt}";
            path = "${pkgs.tree-sitter-grammars.tree-sitter-tsx}/parser";
          }
          {
            name = "libtree-sitter-typescript${sharedLibraryExt}";
            path = "${pkgs.tree-sitter-grammars.tree-sitter-typescript}/parser";
          }
          {
            name = "libtree-sitter-yaml${sharedLibraryExt}";
            path = "${pkgs.tree-sitter-grammars.tree-sitter-yaml}/parser";
          }
        ];
        initDirectory = "$HOME/.local/share/emacs/SuzumiyaAoba";

        emacsConfig = pkgs.stdenvNoCC.mkDerivation {
          pname = "emacs-config";
          version = "0.1.0";
          src = self;
          nativeBuildInputs = [ emacs ];
          dontConfigure = true;
          dontFixup = true;

          buildPhase = ''
            runHook preBuild
            emacs --batch \
              --eval "(require 'org)" \
              --eval "(org-babel-tangle-file \"config.org\")"
            runHook postBuild
          '';

          installPhase = ''
            runHook preInstall
            mkdir -p $out/.emacs.d
            cp config.org $out/config.org
            mv init.el $out/.emacs.d/init.el
            mv early-init.el $out/.emacs.d/early-init.el
            runHook postInstall
          '';
        };

        wrappedEmacs = pkgs.writeShellScriptBin "emacs" ''
          set -eu

          mkdir -p "${initDirectory}/site-lisp"
          mkdir -p "${initDirectory}/var"

          ln -sfn "${emacsConfig}/.emacs.d/init.el" \
            "${initDirectory}/init.el"
          ln -sfn "${emacsConfig}/.emacs.d/early-init.el" \
            "${initDirectory}/early-init.el"
          ln -sfn "${packlet}" \
            "${initDirectory}/site-lisp/packlet"
          ln -sfn "${emacs-batteries}" \
            "${initDirectory}/site-lisp/emacs-batteries"
          ln -sfn "${treeSitterGrammars}" \
            "${initDirectory}/tree-sitter"

          export EMACS_CONFIG_ROOT="${initDirectory}"
          export PATH="${pkgs.lib.makeBinPath [ pkgs.fd pkgs.ripgrep ]}:$PATH"

          exec ${emacsWithPackages}/bin/emacs \
            --init-directory="${initDirectory}" \
            "$@"
        '';
      in
      {
        packages.default = wrappedEmacs;
      }
    );
}
