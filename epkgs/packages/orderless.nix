{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/oantolin/orderless
  pname = "orderless";
  src = sources.emacs-orderless.src;
  version = "20250705.0";
}
