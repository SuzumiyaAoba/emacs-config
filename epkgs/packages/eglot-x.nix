{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/nemethf/eglot-x
  pname = "eglot-x";
  src = sources.emacs-eglot-x.src;
  version = "20251219.0";
}
