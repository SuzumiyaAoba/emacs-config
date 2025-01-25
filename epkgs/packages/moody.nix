{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "moody";
  src = sources.emacs-moody.src;
  version = "1.1.2";
}
