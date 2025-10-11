{ sources, epkgs, css-in-js-mode }:
epkgs.melpaBuild {
  # https://github.com/orzechowskid/tsx-mode.el
  pname = "tsx-mode";
  src = sources.emacs-tsx-mode.src;
  version = "20250101.0";
  packageRequires = with epkgs; [
    css-in-js-mode
  ];
  # Note: Some optional dependencies (cov, treesit-fold, flymake-jsts, indent-bars) 
  # are not available in nixpkgs and have been omitted
}
