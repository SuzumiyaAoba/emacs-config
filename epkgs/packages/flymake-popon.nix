{ sources, epkgs }:
epkgs.melpaBuild {
  # https://codeberg.org/akib/emacs-flymake-popon
  pname = "flymake-popon";
  src = sources.emacs-flymake-popon.src;
  version = "0.5.1";
  packageRequires = with epkgs; [
    popon
    posframe
  ];
}
