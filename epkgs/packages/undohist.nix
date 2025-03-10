{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "undohist";
  src = sources.emacs-undohist.src;
  version = "20240925.754";
}
