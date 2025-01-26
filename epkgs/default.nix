{ pkgs, epkgs }:
let
  # nvfetcherの設定を追加
  sources = pkgs.callPackage ../_sources/generated.nix { };

  anzu = import ./packages/anzu.nix { inherit epkgs sources; };
  consult = import ./packages/consult.nix { inherit epkgs sources; };
  corfu = import ./packages/corfu.nix { inherit epkgs sources; };
  corfu-terminal = import ./packages/corfu-terminal.nix { inherit epkgs sources; };
  css-in-js-mode = import ./packages/css-in-js-mode.nix { inherit epkgs sources; };
  flymake-popon = import ./packages/flymake-popon.nix { inherit epkgs sources; };
  magit = import ./packages/magit.nix { inherit epkgs pkgs sources; };
  modus-themes = import ./packages/modus-themes.nix { inherit epkgs sources; };
  nerd-icons-dired = import ./packages/nerd-icons-dired.nix { inherit epkgs sources; };
  nix-mode = import ./packages/nix-mode.nix { inherit epkgs sources; };
  org-modern-indent = import ./packages/org-modern-indent.nix { inherit epkgs sources; };
  projectile = import ./packages/projectile.nix { inherit epkgs sources; };
  ripgrep = import ./packages/ripgrep.nix { inherit epkgs sources; };
  setup = import ./packages/setup.nix { inherit epkgs sources; };
  tsx-mode = import ./packages/tsx-mode.nix { inherit epkgs sources css-in-js-mode; };
  undohist = import ./packages/undohist.nix { inherit epkgs sources; };
  # vertico = import ./packages/vertico.nix { inherit epkgs sources; };
  vundo = import ./packages/vundo.nix { inherit epkgs sources; };
in
epkgs
// {
  inherit
    anzu
    consult
    corfu
    corfu-terminal
    css-in-js-mode
    flymake-popon
    magit
    modus-themes
    nerd-icons-dired
    nix-mode
    org-modern-indent
    projectile
    ripgrep
    setup
    tsx-mode
    undohist
    # vertico
    vundo
  ;
}
