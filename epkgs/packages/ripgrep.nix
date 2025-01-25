{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "rg";
  src = sources.emacs-rg.src;
  version = "2.3.0";
  packageRequires = with epkgs; [
    wgrep
  ];
}
