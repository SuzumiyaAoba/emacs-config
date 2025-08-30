{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/magit/magit
  pname = "magit";
  src = sources.emacs-magit.src;
  version = "20250830.0";
}
