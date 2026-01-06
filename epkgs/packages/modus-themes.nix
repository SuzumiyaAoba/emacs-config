{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/protesilaos/modus-themes
  pname = "modus-themes";
  src = sources.emacs-modus-themes.src;
  version = "20260103.0";
}
