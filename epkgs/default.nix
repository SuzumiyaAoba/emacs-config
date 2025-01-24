{ pkgs }:
let
  # nvfetcherの設定を追加
  sources = pkgs.callPackage ../_sources/generated.nix { };
in
epkgs:
epkgs
// {
  consult = import ./packages/consult.nix { inherit epkgs sources; };
  magit = import ./packages/magit.nix { inherit epkgs pkgs sources; };
  nix-mode = import ./packages/nix-mode.nix { inherit epkgs sources; };
  setup = import ./packages/setup.nix { inherit epkgs sources; };
}
