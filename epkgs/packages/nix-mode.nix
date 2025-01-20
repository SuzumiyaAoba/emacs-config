{ sources, epkgs }:
epkgs.melpaPackages.nix-mode.overrideAttrs (old: {
  src = sources.nix-mode.src;
  version = "1.5.0";
})
