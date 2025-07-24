{ sources, epkgs, css-in-js-mode }:
epkgs.melpaBuild {
  pname = "tsx-mode";
  src = sources.emacs-tsx-mode.src;
  version = "52cf9e2c818182983de70e9bf8971b9befeb72f9";
  packageRequires = with epkgs; [ ];
}
