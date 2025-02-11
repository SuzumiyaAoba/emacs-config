{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "eglot-booster";
  src = sources.emacs-eglot-booster.src;
  version = "0.1.0";
}
