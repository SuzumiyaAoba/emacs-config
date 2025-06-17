{ sources, epkgs, css-in-js-mode }:
epkgs.melpaBuild {
  # https://github.com/orzechowskid/tsx-mode.el
  pname = "tsx-mode";
  src = sources.emacs-tsx-mode.src;
  version = "20250616.0";
  packageRequires = with epkgs; [
    coverlay
    css-in-js-mode
    (treesit-grammars.with-grammars (
      p: with p; [
        tree-sitter-tsx
      ]
    ))
  ];
}
