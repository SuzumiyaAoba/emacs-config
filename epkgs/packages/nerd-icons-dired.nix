{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/rainstormstudio/nerd-icons-dired
  pname = "nerd-icons-dired";
  src = sources.emacs-nerd-icons-dired.src;
  version = "20250827.1";
    packageRequires = with epkgs; [
    nerd-icons
  ];
}
