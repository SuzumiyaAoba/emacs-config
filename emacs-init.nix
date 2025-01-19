{ pkgs ? import <nixpkgs> {} }:

pkgs.writeTextFile {
  name = "emacs-init";
  destination = "/share/emacs/site-lisp/default.el";
  text = builtins.readFile ./init.el;
}
