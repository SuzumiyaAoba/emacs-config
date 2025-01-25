{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "consult";
  src = sources.emacs-consult.src;
  version = "1.9";
}
