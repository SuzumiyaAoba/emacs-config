{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "corfu-terminal";
  src = sources.emacs-corfu-terminal.src;
  version = "501548c3d51f926c687e8cd838c5865ec45d03cc";
  packageRequires = with epkgs; [ ];
}
