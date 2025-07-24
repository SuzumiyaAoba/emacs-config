{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "nerd-icons-dired";
  src = sources.emacs-nerd-icons-dired.src;
  version = "a7c97534e79c8e7f436249b8b4c5cfa2daf0afe4";
  packageRequires = with epkgs; [ ];
}
