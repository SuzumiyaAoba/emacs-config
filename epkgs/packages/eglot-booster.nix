{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/jdtsmith/eglot-booster
  pname = "eglot-booster";
  src = sources.emacs-eglot-booster.src;
  version = "0.1.0";
}
