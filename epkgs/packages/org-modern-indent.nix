{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "org-modern-indent";
  src = sources.emacs-org-modern-indent.src;
  version = "0.1.4";
}
