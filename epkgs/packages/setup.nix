{ sources, epkgs }:
epkgs.melpaBuild {
  # https://git.sr.ht/~pkal/setup
  pname = "setup";
  src = sources.emacs-setup.src;
  version = "20250131.0";
}
