{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "scss-mode";
  src = sources.emacs-scss-mode.src;
  version = "0.5.0";
}
