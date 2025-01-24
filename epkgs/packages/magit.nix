{
  sources,
  epkgs,
  pkgs,
}:
epkgs.melpaBuild {
  pname = "magit";
  src = sources.emacs-magit.src;
  version = "20250120.1245";
  packageRequires = with epkgs; [
    compat
    dash
    magit-section
    transient
    with-editor
  ];
}
