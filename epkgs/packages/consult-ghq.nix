{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/tomoya/consult-ghq
  pname = "consult-ghq";
  src = sources.emacs-consult-ghq.src;
  version = "20231111.0";
}
