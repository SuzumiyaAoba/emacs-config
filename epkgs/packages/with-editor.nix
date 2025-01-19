{ sources, epkgs }:
epkgs.trivialBuild {
  pname = "with-editor";
  version = sources.with-editor.version;
  src = sources.with-editor.src;
  packageRequires = with epkgs; [ compat ];
  buildPhase = ''
    make lisp
  '';
  installPhase = ''
    mkdir -p $out/share/emacs/site-lisp
    cp lisp/*.el lisp/*.elc $out/share/emacs/site-lisp/
  '';
}
