{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "hydra-posframe";
  src = sources.emacs-hydra-posframe.src;
  version = "1.0.0";
  packageRequires = with epkgs; [
    hydra
    posframe
  ];
}
