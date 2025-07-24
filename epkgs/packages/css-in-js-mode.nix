{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "css-in-js-mode";
  src = sources.emacs-css-in-js-mode.src;
  version = "bcbacde99123f65978580dcf8f1aa51107e546c3";
  packageRequires = with epkgs; [ ];
}
