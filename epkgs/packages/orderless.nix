{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/oantolin/orderless
  pname = "orderless";
  src = sources.emacs-orderless.src;
  version = "1.4";
}
