{ pkgs }:
let
  # nvfetcherの設定を追加
  sources = pkgs.callPackage ../_sources/generated.nix { };
in
epkgs:
epkgs
// {
  magit = import ./packages/magit.nix { inherit epkgs pkgs sources; };
  nix-mode = import ./packages/nix-mode.nix { inherit epkgs sources; };
}
