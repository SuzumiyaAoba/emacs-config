{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "vundo";
  src = sources.emacs-vundo.src;
  version = "2.2.0";
}
