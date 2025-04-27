{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/casouri/vundo
  pname = "vundo";
  src = sources.emacs-vundo.src;
  version = "2.4.0";
}
