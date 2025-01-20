{ pkgs, sources }:
epkgs:
let
  seq = import ./packages/seq.nix { inherit epkgs sources; };
  compat = import ./packages/compat.nix { inherit epkgs sources; };
  dash = import ./packages/dash.nix { inherit epkgs sources; };
  transient = import ./packages/transient.nix { inherit epkgs pkgs sources; };
  with-editor = import ./packages/with-editor.nix { inherit epkgs sources; };
  magit = import ./packages/magit.nix { inherit epkgs pkgs sources; };

  nix-mode = import ./packages/nix-mode.nix { inherit epkgs sources; }; 
in
[
  seq
  compat
  dash
  transient
  with-editor
  magit

  nix-mode
]
