{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "eglot-x";
  src = sources.emacs-eglot-x.src;
  version = "0.6";
}
