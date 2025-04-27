{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/antonj/scss-mode
  pname = "scss-mode";
  src = sources.emacs-scss-mode.src;
  version = "0.5.0";
}
