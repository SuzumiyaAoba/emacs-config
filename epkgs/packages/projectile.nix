{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/bbatsov/projectile
  pname = "projectile";
  src = sources.emacs-projectile.src;
  version = "20250527.0";
}
