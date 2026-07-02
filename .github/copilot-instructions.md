# Copilot Instructions

## Repository purpose

Personal macOS dotfiles and tooling bootstrap. The repo contains plain config files and shell scripts — no build system, no package manager, no test suite.

## Running the scripts

```bash
# Bootstrap Homebrew formulae and casks
chmod +x brew.sh && ./brew.sh

# Install AI CLI tools (idempotent)
chmod +x ai_cli.sh && ./ai_cli.sh

# Force-reinstall all AI CLI tools
./ai_cli.sh --force
```

## Installing config files

Files are symlinked, not copied:

```bash
mkdir -p ~/.config/nvim ~/.config/ghostty
ln -sf "$PWD/.vimrc"              ~/.vimrc
ln -sf "$PWD/config/nvim/init.vim" ~/.config/nvim/init.vim
ln -sf "$PWD/config/starship.toml" ~/.config/starship.toml
ln -sf "$PWD/config/ghostty.txt"   ~/.config/ghostty/config
```

## Shell script conventions

`ai_cli.sh` is the canonical example to follow when adding or modifying scripts:

- `#!/usr/bin/env bash` shebang with `set -euo pipefail`
- `readonly` globals at the top
- Structured logging via `info()` / `error()` helpers (`[INFO]` / `[ERROR]` prefix)
- `cleanup()` registered with `trap cleanup EXIT`; temp files tracked in `TEMP_FILES=()`
- `require_command` guard before using any external dependency
- Argument parsing in a dedicated `parse_args()` function
- Single `main()` entry point called at the bottom as `main "$@"`

`brew.sh` uses the same `set -euo pipefail` and `main()` pattern but is simpler (no logging helpers or temp-file cleanup).

## Key conventions

- **2-space indentation** everywhere (Vim, Neovim, shell scripts).
- `brew.sh` separates formulae (`PACKAGES`) from casks (`CASKS`) in plain bash arrays. Add new tools to the appropriate array.
- `ai_cli.sh` separates npm-based tools (use `install_npm_package`) from remote-installer tools (use `install_remote_script`).
- macOS only — `brew.sh` relies on Homebrew formulae and casks; no Linux path exists.
- No dotfiles framework — keep everything as plain files and shell scripts.
