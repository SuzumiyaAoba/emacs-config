{
  sources,
  epkgs,
  pkgs,
}:
epkgs.melpaPackages.magit.overrideAttrs (old: {
  src = sources.magit.src;
  version = "20230421.2036";
  packageRequires = with epkgs; [ compat dash magit-section transient with-editor ];
})
