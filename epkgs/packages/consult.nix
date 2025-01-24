{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "consult";
  src = sources.emacs-consult.src;
  version = "20250121.1423";
}
