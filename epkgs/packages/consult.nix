{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "consult";
  src = sources.emacs-consult.src;
  version = "20250307.2148";
}
