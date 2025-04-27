{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/jdtsmith/org-modern-indent
  pname = "org-modern-indent";
  src = sources.emacs-org-modern-indent.src;
  version = "0.5.1";
}
