{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "eglot-booster";
  src = sources.emacs-eglot-booster.src;
  version = "cab7803c4f0adc7fff9da6680f90110674bb7a22";
  packageRequires = with epkgs; [ ];
}
