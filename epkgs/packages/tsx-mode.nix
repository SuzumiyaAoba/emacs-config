{ sources, epkgs, css-in-js-mode }:
epkgs.melpaBuild {
  # https://github.com/orzechowskid/tsx-mode.el
  pname = "tsx-mode";
  src = sources.emacs-tsx-mode.src;
  version = "20250821.0";
  packageRequires = with epkgs; [
    css-in-js-mode
  ];
}
