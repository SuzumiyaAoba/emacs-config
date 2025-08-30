{ sources, epkgs }:
epkgs.melpaBuild {
  # https://github.com/copilot-emacs/copilot.el
  pname = "copilot";
  src = sources.emacs-copilot.src;
  version = "20250630.0";
}
