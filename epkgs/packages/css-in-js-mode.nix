{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/orzechowskid/tree-sitter-css-in-js
  pname = "css-in-js-mode";
  src = sources.emacs-css-in-js-mode.src;
  version = "20250316.0";
}
