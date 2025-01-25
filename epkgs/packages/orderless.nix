{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "orderless";
  src = sources.emacs-orderless.src;
  version = "1.3";
}
