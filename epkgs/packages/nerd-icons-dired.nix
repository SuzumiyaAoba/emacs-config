{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/rainstormstudio/nerd-icons-dired
  pname = "nerd-icons-dired";
  src = sources.emacs-nerd-icons-dired.src;
  version = "20250506.0";
  packageRequires = with epkgs; [
    nerd-icons
  ];
}
