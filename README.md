# emacs-config

SuzumiyaAoba's personal Emacs configuration built with Nix flakes and org-babel literate programming.

## Features

- **Nix-based**: Reproducible builds with pinned package versions
- **Literate configuration**: Written in org-mode with tangled Emacs Lisp
- **Modern completion**: Vertico + Consult + Corfu + Orderless stack
- **LSP integration**: Eglot with performance optimizations
- **Multi-language support**: Scala, TypeScript, Go, Rust, Coq, and more
- **Japanese input**: SKK (Simple Kana to Kanji conversion)
- **Git integration**: Magit with visual indicators
- **AI assistance**: GPTel and Ellama integration
- **Project management**: Projectile + Treemacs

## Quick Start

### Running from GitHub

#### GUI Mode
```shell
nix run github:SuzumiyaAoba/emacs-config
```

#### Terminal Mode
```shell
nix run github:SuzumiyaAoba/emacs-config -- -nw
```

### Local Development

```shell
# Clone the repository
git clone https://github.com/SuzumiyaAoba/emacs-config.git
cd emacs-config

# Run locally
nix run .

# Update package sources
nix run .#update

# Update flake inputs
nix flake update
```

## Architecture

This configuration uses a sophisticated build system:

### Configuration Files
- `config.org` - Main configuration in literate org-mode format
- `flake.nix` - Nix flake definition with build instructions
- `packages.nix` - Standard Emacs packages from MELPA/ELPA
- `epkgs/default.nix` - Custom package overrides and builds
- `nvfetcher.toml` - External package source definitions

### Package Management
The configuration employs a hybrid package management approach:

1. **Standard packages**: Installed via `packages.nix` from MELPA/ELPA
2. **Custom packages**: Built from source using definitions in `epkgs/packages/`
3. **External sources**: Managed by nvfetcher for version pinning

### Build Process
1. nvfetcher generates source metadata from `nvfetcher.toml`
2. Nix builds Emacs with all packages using emacs-overlay
3. Configuration files are tangled from `config.org` during build
4. Final executable includes all packages and configuration

### Update Process
- **Package sources**: Run `nix run .#update` to update custom packages defined in `nvfetcher.toml`
- **Flake inputs**: Run `nix flake update` to update nixpkgs, emacs-overlay, and other flake dependencies
- **Lock file**: Both commands update `flake.lock` for reproducible builds

## Key Packages

### Completion & Navigation
- **Vertico**: Vertical completion interface
- **Consult**: Enhanced search and navigation commands
- **Corfu**: In-buffer completion popup
- **Orderless**: Flexible completion style
- **Embark**: Contextual actions

### Programming
- **Eglot**: LSP client with performance boosters
- **Tree-sitter**: Syntax highlighting and parsing
- **Magit**: Git interface
- **Projectile**: Project management
- **Flymake**: On-the-fly syntax checking

### UI & Themes
- **Modus themes**: Accessible color schemes
- **Nerd Icons**: Modern icon set
- **Treemacs**: File tree sidebar
- **Moody**: Enhanced mode line

### Japanese Input
- **ddskk**: Japanese input method
- **ddskk-posframe**: Modern popup interface for SKK

## Configuration Structure

The configuration is organized into logical sections in `config.org`:

- **Early initialization**: Performance optimizations
- **Basic behavior**: File handling, encoding, UI settings
- **Completion system**: Vertico, Consult, Corfu setup
- **Programming**: LSP, syntax highlighting, language-specific settings
- **Documents**: Org-mode, Markdown configuration
- **Git integration**: Magit and related tools
- **AI tools**: GPTel and Ellama setup

## Requirements

- Nix with flakes enabled
- macOS or Linux
- Internet connection for initial package downloads

## Contributing

This is a personal configuration, but feel free to:
- Report issues or bugs
- Suggest improvements
- Use as inspiration for your own configuration

## License

This configuration is provided as-is for educational and personal use.
