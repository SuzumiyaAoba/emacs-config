{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "md-roam";
  src = sources.emacs-md-roam.src;
  version = "20250419.1521";
  packageRequires = with epkgs; [
    org-roam
    markdown-mode
  ];
}
