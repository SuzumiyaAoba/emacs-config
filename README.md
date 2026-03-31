# emacs-config

Minimal Emacs configuration based on [`emacs-batteries`](https://github.com/SuzumiyaAoba/emacs-batteries) and [`packlet`](https://github.com/SuzumiyaAoba/packlet).

## What This Repository Does

- tangles `config.org` into `init.el` and `early-init.el`
- loads `emacs-batteries-early-init.el` from `early-init.el`
- loads the external `packlet` DSL from `init.el`
- loads `emacs-batteries` and runs `emacs-batteries-setup` from `init.el`
- installs `cape` via Nix
- installs `catppuccin-theme` via Nix
- installs `consult` via Nix
- installs `consult-ghq` via Nix
- installs `corfu` via Nix
- installs `corfu-prescient` via Nix
- installs `corfu-terminal` via Nix
- installs `ddskk` via Nix
- installs `git-gutter` via Nix
- installs `git-modes` via Nix
- installs `ripgrep` via Nix
- installs `mlscroll` via Nix
- installs `minions` via Nix
- installs `moody` via Nix
- installs tree-sitter grammars via Nix
- installs `magit` via Nix
- installs `marginalia` via Nix
- installs `markdown-mode` via Nix
- installs `nix-mode` via Nix
- installs `nerd-icons` via Nix
- installs `nerd-icons-corfu` via Nix
- installs `nerd-icons-dired` via Nix
- installs `orderless` via Nix
- installs `projectile` via Nix
- installs `prescient` via Nix
- installs `rainbow-delimiters` via Nix
- installs `undohist` via Nix
- installs `vertico` via Nix
- installs `vundo` via Nix
- keeps the setup intentionally minimal, with no extra packages or personal tweaks

## Requirements

- Nix with flakes enabled
- internet access for fetching flake inputs

`emacs-batteries` targets Emacs 30.1 or newer. This flake uses `emacs-unstable`
from `emacs-overlay`.

## Usage

### Run from GitHub

```shell
nix run github:SuzumiyaAoba/emacs-config
```

```shell
nix run github:SuzumiyaAoba/emacs-config -- -nw
```

### Local Development

```shell
git clone https://github.com/SuzumiyaAoba/emacs-config.git
cd emacs-config

nix build .
nix run .
nix run . -- -nw
```

## Structure

- `config.org`: source of truth for the Emacs configuration
- `flake.nix`: Nix flake that pins Emacs, `emacs-batteries`, and `packlet`
- `flake.lock`: locked input revisions for reproducibility
