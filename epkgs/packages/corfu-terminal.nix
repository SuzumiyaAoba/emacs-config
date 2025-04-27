{ sources, epkgs }:
epkgs.melpaBuild {
  # https://codeberg.org/akib/emacs-corfu-terminal
  pname = "corfu-terminal";
  src = sources.emacs-corfu-terminal.src;
  version = "0.7";
  packageRequires = with epkgs; [
    corfu
    popon
  ];
}
