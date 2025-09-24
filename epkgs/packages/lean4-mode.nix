{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/leanprover-community/lean4-mode
  pname = "lean4-mode";
  src = sources.emacs-lean4-mode.src;
  version = "20250101.1";
  packageRequires = with epkgs; [
    dash
    flycheck
    lsp-mode
    magit-section
  ];
  
  # データファイルをコピーする
  postInstall = ''
    if [ -d "$src/data" ]; then
      ELPA_DIR=$(find $out/share/emacs/site-lisp/elpa -name "lean4-mode-*" -type d | head -1)
      if [ -n "$ELPA_DIR" ]; then
        mkdir -p "$ELPA_DIR/data"
        cp -r "$src/data"/* "$ELPA_DIR/data/"
      fi
    fi
  '';
}

