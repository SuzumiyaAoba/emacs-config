{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "nix-mode";
  src = sources.nix-mode.src;
  version = "20230421.2036";
  packageRequires = with epkgs; [
    magit-section
    transient
    company
    mmm-mode
  ];
}
