# zed-config

Personal developer environment bootstrap with terminal, prompt, Vim/Neovim, Homebrew, and AI CLI tooling.

The repository name is historical. The repo now works as a small macOS-oriented dotfiles and tooling setup for getting a machine ready for daily development quickly.

## What is in this repo

- Terminal and prompt configuration for Ghostty and Starship
- Minimal Vim and Neovim setup
- Homebrew bootstrap script for CLI tools and desktop apps
- AI CLI installer script for local coding-agent tooling

## Repository layout

```text
.
├── .vimrc
├── ai_cli.sh
├── brew.sh
├── config
│   ├── ghostty.txt
│   ├── nvim/init.vim
│   └── starship.toml
└── README.md
```

## Other config files

### `.vimrc`

Small Vim profile with:

- line numbers
- 2-space indentation
- spaces instead of tabs
- search highlighting and smart case
- dark background

### `config/nvim/init.vim`

Minimal Neovim setup with:

- relative numbers
- system clipboard integration
- cursor line
- split navigation defaults
- 2-space indentation

### `config/starship.toml`

Starship prompt with:

- extra newline before prompt
- custom success and error symbols
- package module disabled

### `config/ghostty.txt`

Ghostty terminal preferences with:

- `Box` theme
- `Osaka-Mono` font
- large font size
- fixed window dimensions
- hollow block cursor
- macOS option key mapped as alt

## Bootstrap scripts

### `brew.sh`

Installs the main local toolchain through Homebrew.

Formulae currently included:

- `git`, `gh`, `glab`, `go`, `pre-commit`, `tfswitch`
- `bash`, `starship`, `zellij`, `fzf`, `zoxide`, `nushell`
- `neovim`, `bat`, `eza`, `just`, `htop`, `btop`
- `jq`, `jql`, `yq`
- `k9s`, `k3sup`, `helm`, `helm-docs`, `flux`, `argocd`, `sops`
- `nvm`, `ruff`, `uv`, `pyenv`, `pyenv-virtualenv`
- `dust`, `zsh-autosuggestions`, `p7zip`, `lazygit`
- `pulumi`

Casks currently included:

- `rectangle`
- `maccy`
- `hiddenbar`
- `stats`
- `devtoys`
- `visual-studio-code`
- `ghostty`
- `zed`

The script also installs:

- Bun
- NVM
- Rust via `rustup`
- `zee` via `cargo install --locked zee`

Run it with:

```bash
chmod +x brew.sh
./brew.sh
```

### `ai_cli.sh`

Installs the AI CLIs used alongside this setup.

Included tools:

- OpenAI Codex CLI
- GitHub Copilot CLI
- Google Gemini CLI
- OpenCode AI CLI
- PI Coding Agent
- PI AI
- Claude CLI
- Ollama

Requirements:

- `npm`
- `curl`
- `mktemp`

Run it with:

```bash
chmod +x ai_cli.sh
./ai_cli.sh
```

To reinstall everything:

```bash
./ai_cli.sh --force
```

## Suggested installation

Clone the repository:

```bash
git clone git@github.com:vladtara/zed-config.git
cd zed-config
```

Create target directories:

```bash
mkdir -p ~/.config/nvim ~/.config/ghostty
```

Link the files you want to use:

```bash
ln -sf "$PWD/.vimrc" ~/.vimrc
ln -sf "$PWD/config/nvim/init.vim" ~/.config/nvim/init.vim
ln -sf "$PWD/config/starship.toml" ~/.config/starship.toml
ln -sf "$PWD/config/ghostty.txt" ~/.config/ghostty/config
```

Then optionally bootstrap packages and AI tools:

```bash
./brew.sh
./ai_cli.sh
```

## Useful package

> [!TIP]
> [`get-shit-done`](https://github.com/gsd-build/get-shit-done) is a lightweight spec-driven workflow system for AI coding agents such as Claude Code, Codex, Copilot, and Gemini CLI. It is useful if you want stronger planning, context management, and execution workflows on top of the CLI tools installed by `ai_cli.sh`.
>
> Quick start:
>
> ```bash
> npx get-shit-done-cc@latest
> ```

## Notes

- This setup is mainly macOS-oriented because `brew.sh` uses Homebrew formulas and casks.
- The repo is intentionally simple and uses plain files plus shell scripts instead of a larger dotfiles framework.
- Review scripts before running them on a fresh machine.

## License

MIT. See [LICENSE](LICENSE).
