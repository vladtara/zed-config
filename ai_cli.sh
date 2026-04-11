#!/usr/bin/env bash
set -euo pipefail

readonly SCRIPT_NAME="$(basename "$0")"
readonly CLAUDE_INSTALLER_URL="https://claude.ai/install.sh"
readonly OLLAMA_INSTALLER_URL="https://ollama.com/install.sh"

FORCE_INSTALL=0
TEMP_FILES=()

usage() {
    cat <<EOF
Usage: $SCRIPT_NAME [--force]

Install AI CLI tools used in this setup.

Options:
  --force      Reinstall tools even if they are already present.
  -h, --help   Show this help message.
EOF
}

log() {
    local level="$1"
    local message="$2"

    printf '[%s] %s\n' "$level" "$message"
}

info() {
    log "INFO" "$1"
}

error() {
    log "ERROR" "$1" >&2
}

cleanup() {
    local file

    for file in "${TEMP_FILES[@]}"; do
        if [[ -f "$file" ]]; then
            rm -f "$file"
        fi
    done
}

trap cleanup EXIT

require_command() {
    local command_name="$1"

    if ! command -v "$command_name" >/dev/null 2>&1; then
        error "Required command not found: $command_name"
        exit 1
    fi
}

parse_args() {
    while (($# > 0)); do
        case "$1" in
            --force)
                FORCE_INSTALL=1
                ;;
            -h|--help)
                usage
                exit 0
                ;;
            *)
                error "Unknown argument: $1"
                usage >&2
                exit 1
                ;;
        esac

        shift
    done
}

npm_package_installed() {
    local package_name="$1"

    npm list --global --depth=0 "$package_name" >/dev/null 2>&1
}

install_npm_package() {
    local package_name="$1"
    local display_name="$2"

    if ((FORCE_INSTALL)); then
        info "Installing $display_name..."
        npm install --global "$package_name"
        return
    fi

    if npm_package_installed "$package_name"; then
        info "$display_name is already installed."
        return
    fi

    info "Installing $display_name..."
    npm install --global "$package_name"
}

install_remote_script() {
    local command_name="$1"
    local display_name="$2"
    local installer_url="$3"
    local temp_prefix="$4"
    local installer_path

    if (( ! FORCE_INSTALL )) && command -v "$command_name" >/dev/null 2>&1; then
        info "$display_name is already installed."
        return
    fi

    installer_path="$(mktemp "${TMPDIR:-/tmp}/${temp_prefix}.XXXXXX.sh")"
    TEMP_FILES+=("$installer_path")

    info "Downloading $display_name installer..."
    curl --fail --show-error --silent --location "$installer_url" --output "$installer_path"

    chmod 700 "$installer_path"

    info "Running $display_name installer..."
    bash "$installer_path"
}

install_claude_cli() {
    install_remote_script "claude" "Claude CLI" "$CLAUDE_INSTALLER_URL" "claude-installer"
}

install_ollama() {
    install_remote_script "ollama" "Ollama" "$OLLAMA_INSTALLER_URL" "ollama-installer"
}

main() {
    parse_args "$@"

    require_command curl
    require_command mktemp
    require_command npm

    install_npm_package "@openai/codex" "OpenAI Codex CLI"
    install_npm_package "@github/copilot" "GitHub Copilot CLI"
    install_npm_package "@google/gemini-cli" "Google Gemini CLI"
    install_npm_package "opencode-ai" "OpenCode AI CLI"
    install_npm_package "@mariozechner/pi-coding-agent" "PI Coding Agent"
    install_npm_package "@mariozechner/pi-ai" "PI AI"
    install_claude_cli
    install_ollama

    info "AI CLI tool installation complete."
}

main "$@"
