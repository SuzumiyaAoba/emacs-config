{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/minad/consult
  pname = "consult";
  src = sources.emacs-consult.src;
  version = "20250419.815";
}
