{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "org-modern-indent";
  src = sources.emacs-org-modern-indent.src;
  version = "9973bd3b91e4733a3edd1fca232208c837c05473";
  packageRequires = with epkgs; [ ];
}
