{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/emacsorphanage/anzu
  pname = "anzu";
  src = sources.emacs-anzu.src;
  version = "20240928.0";
}
