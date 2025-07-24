{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "flymake-popon";
  src = sources.emacs-flymake-popon.src;
  version = "99ea813346f3edef7220d8f4faeed2ec69af6060";
  packageRequires = with epkgs; [ ];
}
