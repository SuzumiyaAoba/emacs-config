{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "vertico";
  src = sources.emacs-vertico.src;
  version = "20250117.1814";
  packageRequires = with epkgs; [
  ];
}
