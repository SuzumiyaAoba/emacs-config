{
  description = "SuzumiyaAoba's Emacs configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
  };

  outputs =
    { nixpkgs, flake-utils, emacs-overlay, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        overlays = [ emacs-overlay.overlay ];
        pkgs = import nixpkgs { inherit system overlays; };
      in
        {
          packages.default = (pkgs.emacsWithPackagesFromUsePackage {
            package = pkgs.emacs-unstable;
            config = ./config.org;

            extraEmacsPackages = epkgs: with epkgs; [
              nix-mode
              (pkgs.callPackage ./emacs-init.nix {})
            ];
          });
        }
    );
}
