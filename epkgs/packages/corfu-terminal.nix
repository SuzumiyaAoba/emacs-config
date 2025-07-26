{ sources, epkgs }:
epkgs.melpaBuild {
  # https://codeberg.org/akib/emacs-corfu-terminal
  pname = "corfu-terminal";
  src = sources.emacs-corfu-terminal.src;
  version = "20230810.0";
  packageRequires = with epkgs; [ ];
}
