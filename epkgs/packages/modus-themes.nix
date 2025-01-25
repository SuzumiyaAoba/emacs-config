{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "modus-themes";
  src = sources.emacs-modus-themes.src;
  version = "4.6.0";
}
