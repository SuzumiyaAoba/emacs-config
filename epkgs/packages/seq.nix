{ sources, epkgs }:
epkgs.trivialBuild {
  pname = "seq";
  version = sources.seq.version;
  src = sources.seq.src;
  installPhase = ''
    mkdir -p $out/share/emacs/site-lisp
    cp *.el *.elc $out/share/emacs/site-lisp/
  '';
}
