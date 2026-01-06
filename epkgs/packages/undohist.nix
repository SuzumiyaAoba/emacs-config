{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/emacsorphanage/undohist
  pname = "undohist";
  src = sources.emacs-undohist.src;
  version = "20260104.1";
}
