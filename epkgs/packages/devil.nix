{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "devil";
  src = sources.emacs-devil.src;
  version = "0.6";
}
