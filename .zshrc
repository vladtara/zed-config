# If you come from bash you might have to change your $PATH.
export PATH=/opt/homebrew/bin:$HOME/bin:/usr/local/bin:$PATH
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH=$PATH:$HOME/.rd/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/go/bin
export KUBECONFIG=~/.kube/config

export TF_PLUGIN_CACHE_DIR=$HOME/.terraform-cache.d/plugin-cache 
export TERM=xterm-256color 

# homebrew
export HOMEBREW_NO_ENV_HINTS=1

# autosuggestions 
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-complitions
fpath=($HOME/zsh-completions/src $fpath)

# cfunc
function zreload(){
  source ~/.zshrc
}

# User configuration
function sshadd() {
  if ! ps -ef | grep "[s]sh-agent" &>/dev/null; then
    echo Starting SSH Agent
    eval $(ssh-agent -s)
  fi
  #ssh-add ~/.ssh/zenBook 2>/dev/null
}

export LANG=en_US.UTF-8
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
setopt autocd
autoload -U compinit; compinit -u

# Aliases
alias zshrc="nvim ~/.zshrc"
alias ls="eza"
alias ll="ls -l"
alias lla="ls -la"
alias tf="terraform"
alias vim="nvim"
alias k="kubectl"
alias cat="bat"
alias ccat="bat -p"
alias zd="z"
alias zdi="zi"
alias python="python3"
alias omz="zreload"
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

# nvm node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Argocd complitions
# source <(argocd completion zsh)

# Ocaml
# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/vladtara/.opam/opam-init/init.zsh' ]] || source '/Users/vladtara/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

# fzf history finder
source <(fzf --zsh)

# zoxide
eval "$(zoxide init zsh)"

# Starship
eval "$(starship init zsh)"


# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/Users/vladtara/.bun/_bun" ] && source "/Users/vladtara/.bun/_bun"

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
