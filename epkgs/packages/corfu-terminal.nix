{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "corfu-terminal";
  src = sources.emacs-corfu-terminal.src;
  version = "0.7";
  packageRequires = with epkgs; [
    corfu
    popon
  ];
}
