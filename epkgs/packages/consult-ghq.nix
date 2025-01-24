{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "consult-ghq";
  src = sources.emacs-consult-ghq.src;
  version = "0.0.5";
}
