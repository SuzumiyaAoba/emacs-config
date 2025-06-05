# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Nix-based Emacs configuration that uses org-babel to generate Emacs Lisp configuration from `config.org`. The setup leverages Nix flakes for reproducible builds and package management.

## Key Commands

### Building and Running
- `nix run github:SuzumiyaAoba/emacs-config` - Run Emacs GUI with this configuration
- `nix run github:SuzumiyaAoba/emacs-config -- -nw` - Run Emacs in terminal mode
- `nix run .#update` - Update package sources using nvfetcher

### Development Workflow
- Configuration is primarily written in `config.org` using org-babel
- Emacs configuration is tangled from org-mode to generate `init.el` and `early-init.el`
- Custom package definitions are in `epkgs/packages/`
- Package sources are managed via `nvfetcher.toml` and generated files in `_sources/`

## Architecture

### Configuration Structure
- `config.org` - Main configuration file containing literate Emacs Lisp
- `flake.nix` - Nix flake definition for the Emacs build
- `packages.nix` - Standard Emacs packages list
- `epkgs/default.nix` - Custom package overrides and definitions
- `nvfetcher.toml` - External package source definitions

### Package Management
The configuration uses a hybrid approach:
1. Standard packages from MELPA/ELPA via `packages.nix`
2. Custom packages built from source via `epkgs/packages/` directory
3. External sources managed by nvfetcher for version pinning

### Build Process
1. nvfetcher generates `_sources/generated.nix` from `nvfetcher.toml`
2. Nix builds Emacs with packages using emacs-overlay
3. Configuration files are tangled from `config.org` during build
4. Final Emacs executable includes all packages and configuration

### Key Components
- Uses `setup.el` macro system for package configuration
- Implements custom `-setup` macro that integrates with elpaca
- Configuration organized by functional areas (completion, programming, etc.)
- Extensive use of conditional loading based on system type (Darwin vs Linux)

## Development Notes

### Adding New Packages
1. For standard packages: Add to `packages.nix`
2. For custom/forked packages: Add to `nvfetcher.toml`, then create package definition in `epkgs/packages/`
3. Configure the package in appropriate section of `config.org`

### Modifying Configuration
- Edit `config.org` for configuration changes
- Use org-babel code blocks with `:tangle` property
- Configuration is automatically tangled during Nix build

### Custom Package Sources
External packages are defined in `nvfetcher.toml` and built as custom derivations. This allows for:
- Version pinning of upstream packages
- Building from specific Git commits/branches
- Custom patches or modifications