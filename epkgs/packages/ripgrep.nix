{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/dajva/rg.el
  pname = "rg";
  src = sources.emacs-rg.src;
  version = "2.3.0";
  packageRequires = with epkgs; [
    wgrep
  ];
}
