{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/rainstormstudio/nerd-icons-dired
  pname = "nerd-icons-dired";
  src = sources.emacs-nerd-icons-dired.src;
  version = "20241013.212";
  packageRequires = with epkgs; [
    nerd-icons
  ];
}
