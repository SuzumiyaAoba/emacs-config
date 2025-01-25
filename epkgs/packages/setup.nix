{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "setup";
  src = sources.emacs-setup.src;
  version = "1.4.0";
}
