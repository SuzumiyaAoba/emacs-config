{
  sources,
  epkgs,
  pkgs,
}:
epkgs.melpaPackages.magit.overrideAttrs (old: {
  src = sources.magit.src;
  version = "4.2.0";
})
