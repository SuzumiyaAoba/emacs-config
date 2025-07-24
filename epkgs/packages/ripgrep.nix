{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "ripgrep";
  src = sources.emacs-rg.src;
  version = "7611852b5517212a4f0fdab9cd9ecb0cf3995f08";
  packageRequires = with epkgs; [ ];
}
