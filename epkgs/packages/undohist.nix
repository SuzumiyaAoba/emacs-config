{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "undohist";
  src = sources.emacs-undohist.src;
  version = "0.3.0";
}
