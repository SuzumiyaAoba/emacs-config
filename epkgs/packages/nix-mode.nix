{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "nix-mode";
  src = sources.emacs-nix-mode.src;
  version = "719feb7868fb567ecfe5578f6119892c771ac5e5";
  packageRequires = with epkgs; [ ];
}
