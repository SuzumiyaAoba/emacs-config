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
        toml-mdiin = epkgs.trivialBuild {
          pname = "toml";
          version = "1.0.0";
          src = pkgs.fetchzip {
            url = "https://github.com/mdiin/emacs-toml/archive/c1ac308a7677a6447bbabee7c9f9dcbeb63be9cb.tar.gz";
            hash = "sha256-g1bqOWJz/Btq4gc+oZaUkwsC3fvMnZx3kuka86G0rEI=";
          };
        };
        eglot-supplements = epkgs.trivialBuild {
          pname = "eglot-supplements";
          version = "0-unstable-2026-04-18";
          src = pkgs.fetchzip {
            url = "https://codeberg.org/harald/eglot-supplements/archive/af5221f2f49a6d5c3a38adca4ca89bd05595a71c.tar.gz";
            hash = "sha256-q3eAjc3zweVMdn1OZKcr6JeKtSgOf3QapyDHNMH/UXY=";
          };
          packageRequires = [ epkgs.eglot ];
        };
        flix-mode = epkgs.trivialBuild {
          pname = "flix-mode";
          version = "1.0.1";
          src = pkgs.fetchzip {
            url = "https://codeberg.org/mdiin/flix-mode/archive/cff79298157b757a5db7032b06583ea5bf5eac9e.tar.gz";
            hash = "sha256-POh79s4J1Tl4eaWOR6sZWr43HesNXuOZKH+sf/Pu/W8=";
          };
          packageRequires = [ toml-mdiin ];
        };
        emacsWithPackages = epkgs.emacsWithPackages (
          epkgs': with epkgs'; [
            ace-window
            aidermacs
            anzu
            avy
            blamer
            cape
            catppuccin-theme
            consult
            consult-eglot
            consult-ghq
            consult-projectile
            corfu
            corfu-prescient
            corfu-terminal
            coverlay
            dap-mode
            ddskk
            ddskk-posframe
            dockerfile-mode
            editorconfig
            eglot-booster
            eglot-supplements
            eldoc-box
            ellama
            embark
            embark-consult
            exec-path-from-shell
            flix-mode
            flymake-popon
            git-gutter
            git-modes
            git-timemachine
            go-mode
            gptel
            groovy-mode
            highlight-defined
            highlight-quoted
            highlight-symbol
            hydra
            keycast
            kotlin-mode
            ligature
            magit
            major-mode-hydra
            marginalia
            markdown-mode
            minions
            mlscroll
            moody
            multiple-cursors
            nerd-icons
            nerd-icons-completion
            nerd-icons-corfu
            nerd-icons-dired
            nginx-mode
            nix-mode
            orderless
            org-roam
            org-roam-ui
            origami
            prescient
            projectile
            proof-general
            rainbow-delimiters
            rainbow-mode
            rg
            sbt-mode
            scala-mode
            scss-mode
            treemacs
            treemacs-magit
            treemacs-nerd-icons
            treemacs-projectile
            treemacs-tab-bar
            treesit-auto
            undohist
            vertico
            vertico-prescient
            volatile-highlights
            vundo
            web-mode
            which-key
            yaml-mode
          ]
        );
        treeSitterGrammars =
          let
            langs = [
              "bash" "c" "cmake" "cpp" "css" "dockerfile" "go" "html"
              "java" "javascript" "json" "python" "rust" "toml" "tsx"
              "typescript" "yaml"
            ];
            mkGrammar = lang: {
              name = "libtree-sitter-${lang}${sharedLibraryExt}";
              path = "${pkgs.tree-sitter-grammars."tree-sitter-${lang}"}/parser";
            };
          in
          pkgs.linkFarm "emacs-tree-sitter-grammars" (map mkGrammar langs);
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
          export PATH="${
            pkgs.lib.makeBinPath [
              pkgs.emacs-lsp-booster
              pkgs.jdk
              pkgs.ripgrep
            ]
          }:$PATH"

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
