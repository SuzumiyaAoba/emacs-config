{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "corfu";
  src = sources.emacs-corfu.src;
  version = "1.6";
}
