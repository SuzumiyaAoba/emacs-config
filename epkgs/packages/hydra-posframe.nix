{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "hydra-posframe";
  src = sources.emacs-hydra-posframe.src;
  version = "142a04dd588af6c725e331863c3ca7bd5dda13ec";
  packageRequires = with epkgs; [ ];
}
