{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/tarsius/moody
  pname = "moody";
  src = sources.emacs-moody.src;
  version = "20250601.0";
}
