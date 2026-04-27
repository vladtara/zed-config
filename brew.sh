#!/usr/bin/env bash
set -euo pipefail



PACKAGES=(
    # Add package names here, e.g. git wget node
    git
    gh
    glab
    go
    pre-commit
    warrensbox/tap/tfswitch
    bash
    starship
    zellij
    fzf
    zoxide
    nushell
    neovim
    bat
    eza
    just
    htop
    btop
    jq
    jql
    yq
    k9s
    k3sup
    helm
    helm-docs
    dgunzy/tap/flux9s
    fluxcd/tap/flux
    argocd
    sops
    nvm
    ruff
    uv
    dust
    zsh-autosuggestions
    p7zip
    pyenv
    pyenv-virtualenv
    lazygit
    pulumi/tap/pulumi
)

CASKS=(
    rectangle
    maccy
    hiddenbar
    stats
    devtoys
    visual-studio-code
    ghostty
    zed
    freelens


)

check_brew_installed() {
    if ! command -v brew &>/dev/null; then
        echo "Error: Homebrew is not installed." >&2
        exit 1
    fi
}

update_brew() {
    echo "Updating Homebrew..."
    brew update
}

install_package() {
    local pkg="$1"
    if brew list --formula | grep -qx "$pkg"; then
        echo "$pkg is already installed."
    else
        echo "Installing $pkg..."
        brew install "$pkg"
    fi
}

install_cask() {
    local cask="$1"
    if brew list --cask | grep -qx "$cask"; then
        echo "$cask (cask) is already installed."
    else
        echo "Installing $cask (cask)..."
        brew install --cask "$cask"
    fi
}

mangers() {
    curl -fsSL https://bun.com/install | bash
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

cargo_install() {
    cargo install --locked zee
}

main() {
    check_brew_installed
    update_brew
    for pkg in "${PACKAGES[@]}"; do
        install_package "$pkg"
    done
    for cask in "${CASKS[@]}"; do
        install_cask "$cask"
    done
    echo "All packages processed."
    echo "Install bun and nvm, rust"
    mangers
    echo "All runtime processed."
    echo "Install cargo packages"
    cargo_install
    echo "All cargo packages processed."
}

main
