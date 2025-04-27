{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/NixOS/nix-mode
  pname = "nix-mode";
  src = sources.emacs-nix-mode.src;
  version = "20230421.2036";
  packageRequires = with epkgs; [
    magit-section
    transient
    company
    mmm-mode
  ];
}
