{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "vertico";
  src = sources.emacs-vertico.src;
  version = "d8dc49a3520ab908c2b0f62a4a8ae32ca23f2726";
  packageRequires = with epkgs; [ ];
}
