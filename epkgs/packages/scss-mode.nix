{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "scss-mode";
  src = sources.emacs-scss-mode.src;
  version = "e8f8a4d64e46f05a833fce2b684d6cb02bd6a94d";
  packageRequires = with epkgs; [ ];
}
