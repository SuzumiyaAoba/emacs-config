{ sources, epkgs }:
epkgs.melpaBuild {
  # https://codeberg.org/akib/emacs-flymake-popon
  pname = "flymake-popon";
  src = sources.emacs-flymake-popon.src;
  version = "20230208.0";
  packageRequires = with epkgs; [ ];
}
