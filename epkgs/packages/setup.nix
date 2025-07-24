{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "setup";
  src = sources.emacs-setup.src;
  version = "dfea961eede4023b38f58722bd65c337975d2cb0";
  packageRequires = with epkgs; [ ];
}
