{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/minad/vertico
  pname = "vertico";
  src = sources.emacs-vertico.src;
  version = "20250702.0";
}
