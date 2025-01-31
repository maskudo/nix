# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone --depth 1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Append to the history file, don't overwrite it
setopt appendhistory
# setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
# For setting history length
HISTSIZE=5000
SAVEHIST=5000
HISTDUP=erase


# Load aliases if ~/.bash_aliases exists
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

alias ns='nix-shell --command zsh'

# emacs mode for keybinds such as C-p C-n
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey -s '^F' "tmux-sessionizer\n"
bindkey '\e\e' vi-cmd-mode
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word


# Environment variables
export TERMINAL=kitty

export CALCURSE_EDITOR=vi
export VISUAL=vi

#go
export GOPATH=~/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

export EMACSDIR="$HOME/.config/emacs"
export DOOMDIR="$HOME/.config/doom"
export DOOM_PATH="$HOME/.config/emacs/bin"
export PATH=$PATH:$DOOM_PATH

export PATH="/usr/local/ssl/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/ssl/lib:$LD_LIBRARY_PATH"
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/.asdf/shims

export CARGO_BIN="$HOME/.cargo/bin"
export PATH=$PATH:$CARGO_BIN

export SCRIPTS=~/.local/bin/scripts
export PATH=$PATH:$SCRIPTS
export EDITOR=nvim

# pnpm
export PNPM_HOME="/home/mk489/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Load cargo and ghcup environments if present
[ -f ~/.cargo/env ] && source $HOME/.cargo/env

# Initialize starship prompt
eval "$(starship init zsh)"

if command -v ag &>/dev/null; then
    export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
fi
if command -v rg &>/dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi

source <(fzf --zsh)

# direnv
eval "$(direnv hook zsh)"
export DIRENV_LOG_FORMAT=""

# Atuin setup
eval "$(atuin init zsh --disable-up-arrow)"
source ~/.zsh-syntax-highlighting.sh

# zinit light zsh-users/zsh-syntax-highlighting
# zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

bindkey '^ ' autosuggest-accept

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

eval "$(zoxide init --cmd j zsh)"

