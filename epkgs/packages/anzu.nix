{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "anzu";
  src = sources.emacs-anzu.src;
  version = "21cb5ab2295614372cb9f1a21429381e49a6255f";
  packageRequires = with epkgs; [ ];
}
