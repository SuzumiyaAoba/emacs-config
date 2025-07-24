{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "undohist";
  src = sources.emacs-undohist.src;
  version = "307c0fbaab630595c0fc1f112cf7ac5a0c4c4a26";
  packageRequires = with epkgs; [ ];
}
