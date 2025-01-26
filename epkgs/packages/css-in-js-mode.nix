{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "css-in-js-mode";
  src = sources.emacs-css-in-js-mode.src;
  version = "20240604.0.1";
}
