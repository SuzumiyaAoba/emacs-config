{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "orderless";
  src = sources.emacs-orderless.src;
  version = "082a487f79ca5e960046a31599a5f97dac79a858";
  packageRequires = with epkgs; [ ];
}
