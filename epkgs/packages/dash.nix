{ sources, epkgs }:
epkgs.trivialBuild {
  pname = "dash";
  version = sources.dash.version;
  src = sources.dash.src;
  installPhase = ''
    mkdir -p $out/share/emacs/site-lisp
    cp *.el *.elc $out/share/emacs/site-lisp/
  '';
}
