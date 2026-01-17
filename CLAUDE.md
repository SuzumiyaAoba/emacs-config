# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Nix-based Emacs configuration that uses org-babel to generate Emacs Lisp configuration from `config.org`. The setup leverages Nix flakes for reproducible builds and package management.

## Key Commands

### Building and Running
- `nix run github:SuzumiyaAoba/emacs-config` - Run Emacs GUI with this configuration
- `nix run github:SuzumiyaAoba/emacs-config -- -nw` - Run Emacs in terminal mode

### Development Workflow
- Configuration is primarily written in `config.org` using org-babel
- Emacs configuration is tangled from org-mode to generate `init.el` and `early-init.el`

## Architecture

### Configuration Structure
- `config.org` - Main configuration file containing literate Emacs Lisp
- `flake.nix` - Nix flake definition for the Emacs build

### Package Management
The configuration uses a hybrid approach:
1. Standard packages via Elpaca in `config.org`

### Build Process
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
1. For standard packages: Add to `config.org` (Elpaca)
3. Configure the package in appropriate section of `config.org`

### Modifying Configuration
- Edit `config.org` for configuration changes
- Use org-babel code blocks with `:tangle` property
- Configuration is automatically tangled during Nix build

### Custom Package Sources
External packages are installed via Elpaca recipes in `config.org`.
- Version pinning of upstream packages
- Building from specific Git commits/branches
- Custom patches or modifications
