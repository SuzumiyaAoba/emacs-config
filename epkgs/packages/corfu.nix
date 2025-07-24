{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "corfu";
  src = sources.emacs-corfu.src;
  version = "5e9a2229322541c1ee28b72128cf7c097b32dd5d";
  packageRequires = with epkgs; [ ];
}
