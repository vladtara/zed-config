#!/usr/bin/env bash
set -euo pipefail

PACKAGES=(
    # Add package names here, e.g. git wget node
    git
    gh
    glab
    pre-commit
    tfswitch
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
    flux
    argocd
    sops
    nvm
    ruff
    uv
    dust
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

main() {
    check_brew_installed
    update_brew
    for pkg in "${PACKAGES[@]}"; do
        install_package "$pkg"
    done
    echo "All packages processed."
}

main
