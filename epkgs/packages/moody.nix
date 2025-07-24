{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "moody";
  src = sources.emacs-moody.src;
  version = "404400af5415a35b5639dd1bfbc192751e85d737";
  packageRequires = with epkgs; [ ];
}
