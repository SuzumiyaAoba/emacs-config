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
        # mailutils 3.21 currently fails to link on Darwin. Emacs only uses it
        # for movemail, so keep the integration enabled on other platforms.
        emacs = pkgs.emacs-unstable.override {
          withMailutils = !pkgs.stdenv.hostPlatform.isDarwin;
        };
        emacsLspBooster = pkgs.emacs-lsp-booster.override { inherit emacs; };
        epkgs = pkgs.emacsPackagesFor emacs;
        sharedLibraryExt = pkgs.stdenv.hostPlatform.extensions.sharedLibrary;
        packletPackage = epkgs.trivialBuild {
          pname = "packlet";
          version = "0.1.0";
          src = packlet;
        };
        emacsBatteriesPackage = epkgs.trivialBuild {
          pname = "emacs-batteries";
          version = "0.1.0";
          src = emacs-batteries;
        };
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
            packletPackage
            emacsBatteriesPackage
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
          nativeBuildInputs = [ emacsWithPackages ];
          dontConfigure = true;
          dontFixup = true;

          buildPhase = ''
            runHook preBuild
            emacs --quick --batch \
              --eval "(require 'org)" \
              --eval "(org-babel-tangle-file \"config.org\")"
            emacs --quick --batch \
              --eval "(require 'packlet)" \
              --eval "(setq packlet--compile-site-counter 0)" \
              --eval "(advice-add 'packlet--expansion-site :override (lambda (feature _body) (list 'compiled feature (cl-incf packlet--compile-site-counter))))" \
              --eval "(setq byte-compile-warnings '(not free-vars unresolved noruntime lexical make-local))" \
              --eval "(byte-compile-file \"init.el\")" \
              --eval "(byte-compile-file \"early-init.el\")"
            runHook postBuild
          '';

          installPhase = ''
            runHook preInstall
            mkdir -p $out/.emacs.d
            cp config.org $out/config.org
            mv init.el $out/.emacs.d/init.el
            mv init.elc $out/.emacs.d/init.elc
            mv early-init.el $out/.emacs.d/early-init.el
            mv early-init.elc $out/.emacs.d/early-init.elc
            runHook postInstall
          '';
        };

        # Shared prelude: link the compiled config and tree-sitter grammars
        # into the init directory and export the environment both entrypoints need.
        commonSetup = ''
          mkdir -p "${initDirectory}/var"

          ln -sfn \
            "${emacsConfig}/.emacs.d/init.el" \
            "${emacsConfig}/.emacs.d/init.elc" \
            "${emacsConfig}/.emacs.d/early-init.el" \
            "${emacsConfig}/.emacs.d/early-init.elc" \
            "${initDirectory}/"
          ln -sfn "${treeSitterGrammars}" \
            "${initDirectory}/tree-sitter"

          export EMACS_CONFIG_ROOT="${initDirectory}"
          export PATH="${
            pkgs.lib.makeBinPath [
              emacsLspBooster
              pkgs.jdk
              pkgs.ripgrep
            ]
          }:$PATH"
        '';

        # One-shot launch: a fresh Emacs process per invocation.
        wrappedEmacs = pkgs.writeShellScriptBin "emacs" ''
          set -eu
          ${commonSetup}
          exec ${emacsWithPackages}/bin/emacs \
            --init-directory="${initDirectory}" \
            "$@"
        '';

        # Daemon-backed launch: start the daemon on first use, then connect
        # with emacsclient so every subsequent frame opens near-instantly.
        wrappedEmacsclient = pkgs.writeShellScriptBin "emacsclient" ''
          set -eu
          ${commonSetup}

          socket="emacs-config"
          client="${emacsWithPackages}/bin/emacsclient"

          if ! "$client" -s "$socket" --eval t >/dev/null 2>&1; then
            ${emacsWithPackages}/bin/emacs \
              --init-directory="${initDirectory}" \
              --daemon="$socket"
          fi

          exec "$client" -s "$socket" -c "$@"
        '';
      in
      {
        packages.default = wrappedEmacs;
        packages.emacs = wrappedEmacs;
        packages.client = wrappedEmacsclient;

        apps.default = {
          type = "app";
          program = "${wrappedEmacs}/bin/emacs";
        };
        apps.client = {
          type = "app";
          program = "${wrappedEmacsclient}/bin/emacsclient";
        };
      }
    );
}
