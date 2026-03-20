{
  description = "SuzumiyaAoba's Emacs configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      emacs-overlay,
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

        clientScript = pkgs.writeShellScriptBin "emacsclient" ''
          exec ${emacsPackage}/bin/emacsclient
        '';

        prewarmEl = pkgs.writeText "prewarm.el" ''
          ;;; prewarm.el --- Prewarm Elpaca packages and native compilation -*- lexical-binding: t; -*-

          (require 'cl-lib)
          (require 'seq)

          (defun my/prewarm--elpaca-incomplete-p ()
            "Return non-nil when any Elpaca queue is incomplete."
            (and (boundp 'elpaca--queues)
                 (cl-some (lambda (queue)
                            (eq (elpaca-q<-status queue) 'incomplete))
                          elpaca--queues)))

          (defun my/prewarm--wait-for-elpaca ()
            "Finish pending Elpaca queues for the current init."
            (when (require 'elpaca nil t)
              (while (my/prewarm--elpaca-incomplete-p)
                (elpaca-process-queues)
                (elpaca-wait))))

          (defun my/prewarm--prepare-load-path ()
            "Add Elpaca build directories to `load-path'."
            (let ((builds-dir (expand-file-name "elpaca/builds" user-emacs-directory)))
              (when (file-directory-p builds-dir)
                (add-to-list 'load-path builds-dir)
                (let ((default-directory builds-dir))
                  (normal-top-level-add-subdirs-to-load-path)))))

          (defun my/prewarm--native-compile-targets ()
            "Return Emacs Lisp files worth native compiling for this setup."
            (let ((init-el (expand-file-name "init.el" user-emacs-directory))
                  (early-init-el (expand-file-name "early-init.el" user-emacs-directory))
                  (builds-dir (expand-file-name "elpaca/builds" user-emacs-directory)))
              (delete-dups
               (append
                (seq-filter #'file-exists-p (list early-init-el init-el))
                (when (file-directory-p builds-dir)
                  (directory-files-recursively
                   builds-dir
                   "\\.el\\'"
                   nil
                   (lambda (dir)
                     (let ((name (file-name-nondirectory (directory-file-name dir))))
                       (not (member name '(".git" "doc" "docs" "test" "tests")))))))))))

          (defun my/prewarm-print-targets ()
            "Wait for Elpaca, then print native compile targets as NUL-separated paths."
            (my/prewarm--wait-for-elpaca)
            (dolist (target (my/prewarm--native-compile-targets))
              (princ target)
              (princ "\0")))

          (defun my/prewarm-compile-command-line ()
            "Native compile files passed after `--' on the command line."
            (my/prewarm--prepare-load-path)
            (let ((files (seq-remove (lambda (arg)
                                       (string= arg "--"))
                                     command-line-args-left))
                  failures)
              (dolist (file files)
                (message "[prewarm] compiling %s" file)
                (condition-case err
                    (native-compile file)
                  (error
                   (push (cons file err) failures)
                   (message "[prewarm] failed %s: %S" file err))))
              (if failures
                  (progn
                    (dolist (failure (nreverse failures))
                      (message "[prewarm] failure %s: %S" (car failure) (cdr failure)))
                    (kill-emacs 1))
                (kill-emacs 0))))
        '';

        prewarmScript = pkgs.writeShellScriptBin "prewarm" ''
          set -euo pipefail

          if [ -n "''${EMACS_PREWARM_JOBS:-}" ]; then
            jobs="''${EMACS_PREWARM_JOBS}"
          else
            cpu_count="$(sysctl -n hw.logicalcpu 2>/dev/null || getconf _NPROCESSORS_ONLN 2>/dev/null || echo 4)"
            jobs="$(( cpu_count > 1 ? cpu_count / 2 : 1 ))"
            if [ "$jobs" -gt 8 ]; then
              jobs=8
            fi
          fi

          if [ ! -e "${initDirectory}" ]; then
            mkdir -p "${initDirectory}"
          fi

          ln -sf "${emacsConfig}/.emacs.d/init.el"       "${initDirectory}/init.el"
          ln -sf "${emacsConfig}/.emacs.d/early-init.el" "${initDirectory}/early-init.el"

          target_file="$(mktemp)"
          trap 'rm -f "$target_file"' EXIT

          ${emacsPackage}/bin/emacs \
            --init-directory="${initDirectory}" \
            --batch \
            -l ${prewarmEl} \
            --eval "(my/prewarm-print-targets)" > "$target_file"

          echo "[prewarm] using $jobs parallel native compile workers"

          xargs -0 -P "$jobs" -n 32 ${emacsPackage}/bin/emacs \
            --init-directory="${initDirectory}" \
            --batch \
            -l ${prewarmEl} \
            --eval "(my/prewarm-compile-command-line)" \
            -- < "$target_file"
        '';
      in
      {
        packages.default = wrappedEmacs;
        packages.emacseditor = editorScript;
        packages.emacsclient = clientScript;
        packages.prewarm = prewarmScript;

        allowUnfree = true;

      }
    );
}
