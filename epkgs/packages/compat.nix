{ sources, epkgs }:
epkgs.trivialBuild {
  pname = "compat";
  src = sources.compat.src;
  version = sources.compat.version;
  packageRequires = with epkgs; [ seq ];
  installPhase = ''
    mkdir -p $out/share/emacs/site-lisp
    cp *.el *.elc $out/share/emacs/site-lisp/
  '';
}
