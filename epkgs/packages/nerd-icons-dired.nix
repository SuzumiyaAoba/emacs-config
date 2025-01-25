{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "nerd-icons-dired";
  src = sources.emacs-nerd-icons-dired.src;
  version = "20241013.212";
  packageRequires = with epkgs; [
    nerd-icons
  ];
}
