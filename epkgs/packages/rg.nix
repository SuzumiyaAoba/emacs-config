{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/dajva/rg.el
  pname = "rg";
  src = sources.emacs-rg.src;
  version = "20250625.0";
}
