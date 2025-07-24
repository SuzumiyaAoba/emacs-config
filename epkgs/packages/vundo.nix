{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "vundo";
  src = sources.emacs-vundo.src;
  version = "30f85b4ae1f2a7189d44bb738b49559928d046cb";
  packageRequires = with epkgs; [ ];
}
