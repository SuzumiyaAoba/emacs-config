{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/Ladicle/hydra-posframe
  pname = "hydra-posframe";
  src = sources.emacs-hydra-posframe.src;
  version = "20230717.0";
  packageRequires = with epkgs; [
    hydra
    posframe
  ];
}
