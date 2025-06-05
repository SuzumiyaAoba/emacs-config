{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/antonj/scss-mode
  pname = "scss-mode";
  src = sources.emacs-scss-mode.src;
  version = "20241228.0";
}
