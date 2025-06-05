{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/jdtsmith/eglot-booster
  pname = "eglot-booster";
  src = sources.emacs-eglot-booster.src;
  version = "20250428.0";
}
