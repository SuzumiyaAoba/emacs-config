{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "consult";
  src = sources.emacs-consult.src;
  version = "d32cccdcb5559b503306291fa9f52df19594d687";
  packageRequires = with epkgs; [ ];
}
