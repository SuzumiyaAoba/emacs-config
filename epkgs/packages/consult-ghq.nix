{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "consult-ghq";
  src = sources.emacs-consult-ghq.src;
  version = "65a99980fb313d473376542cb87464a8a44ff25e";
  packageRequires = with epkgs; [ ];
}
