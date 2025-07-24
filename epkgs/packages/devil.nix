{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "devil";
  src = sources.emacs-devil.src;
  version = "c2dc9fc2886471daff654e12b46a144a4d1361ae";
  packageRequires = with epkgs; [ ];
}
