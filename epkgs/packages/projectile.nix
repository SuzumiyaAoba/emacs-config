{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "projectile";
  src = sources.emacs-projectile.src;
  version = "9325c45e0fd96d5421e75ad901a91ee5353e10ad";
  packageRequires = with epkgs; [ ];
}
