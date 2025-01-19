{ sources, epkgs }:
epkgs.trivialBuild {
  pname = "compat";
  version = sources.compat.version;
  src = sources.compat.src;
  packageRequires = with epkgs; [ seq ];
  installPhase = ''
    mkdir -p $out/share/emacs/site-lisp
    cp *.el *.elc $out/share/emacs/site-lisp/
  '';
}
