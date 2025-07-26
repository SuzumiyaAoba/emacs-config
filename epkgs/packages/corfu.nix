{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/minad/corfu
  pname = "corfu";
  src = sources.emacs-corfu.src;
  version = "20250617.0";
}
