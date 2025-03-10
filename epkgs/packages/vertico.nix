{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "vertico";
  src = sources.emacs-vertico.src;
  version = "20250309.1959";
  packageRequires = with epkgs; [
  ];
}
