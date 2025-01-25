{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "anzu";
  src = sources.emacs-anzu.src;
  version = "0.67";
}
