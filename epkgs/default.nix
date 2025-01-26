{ pkgs }:
let
  # nvfetcherの設定を追加
  sources = pkgs.callPackage ../_sources/generated.nix { };
in
epkgs:
epkgs
// {
  anzu = import ./packages/anzu.nix { inherit epkgs sources; };
  consult = import ./packages/consult.nix { inherit epkgs sources; };
  corfu = import ./packages/corfu.nix { inherit epkgs sources; };
  corfu-terminal = import ./packages/corfu-terminal.nix { inherit epkgs sources; };
  magit = import ./packages/magit.nix { inherit epkgs pkgs sources; };
  modus-themes = import ./packages/modus-themes.nix { inherit epkgs sources; };
  nerd-icons-dired = import ./packages/nerd-icons-dired.nix { inherit epkgs sources; };
  nix-mode = import ./packages/nix-mode.nix { inherit epkgs sources; };
  org-modern-indent = import ./packages/org-modern-indent.nix { inherit epkgs sources; };
  projectile = import ./packages/projectile.nix { inherit epkgs sources; };
  ripgrep = import ./packages/ripgrep.nix { inherit epkgs sources; };
  setup = import ./packages/setup.nix { inherit epkgs sources; };
  undohist = import ./packages/undohist.nix { inherit epkgs sources; };
  vertico = import ./packages/vertico.nix { inherit epkgs sources; };
  vundo = import ./packages/vundo.nix { inherit epkgs sources; };
}
