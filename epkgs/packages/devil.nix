{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/susam/devil
  pname = "devil";
  src = sources.emacs-devil.src;
  version = "0.6.0";
}
