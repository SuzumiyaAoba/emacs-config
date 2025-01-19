{
  sources,
  epkgs,
  pkgs,
}:
epkgs.trivialBuild {
  pname = "transient";
  version = sources.transient.version;
  src = sources.transient.src;
  packageRequires = with epkgs; [ compat ];
  buildInputs = with pkgs; [
    texlive.combined.scheme-basic
    texinfo
  ];
  buildPhase = ''
    cd lisp
    make
    cd ..
  '';
  installPhase = ''
    mkdir -p $out/share/emacs/site-lisp
    cp lisp/*.el lisp/*.elc $out/share/emacs/site-lisp/
  '';
}
