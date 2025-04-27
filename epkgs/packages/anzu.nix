{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/emacsorphanage/anzu
  pname = "anzu";
  src = sources.emacs-anzu.src;
  version = "0.67";
}
