{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "flymake-popon";
  src = sources.emacs-flymake-popon.src;
  version = "0.5.1";
  packageRequires = with epkgs; [
    popon
    posframe
  ];
}
