# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	;;
*) ;;
esac


if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi
# [[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source /home/mk489/.autojump/etc/profile.d/autojump.sh

export TERMINAL=kitty

# go
export GOPATH=~/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

export PATH="/usr/local/ssl/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/ssl/lib:$LD_LIBRARY_PATH"

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

ASDFSHIM="$HOME/.asdf/shims"
export PATH=$PATH:$ASDFSHIM

export CARGO_BIN="$HOME/.cargo/bin"
export PATH=$PATH:$CARGO_BIN

export SCRIPTS=~/.local/bin/scripts
export PATH=$PATH:$SCRIPTS

#nvim
export EDITOR=nvim

[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env
[ -f ~/.cargo/env ] && source $HOME/.cargo/env

eval
__main() {
	local major="${BASH_VERSINFO[0]}"
	local minor="${BASH_VERSINFO[1]}"

	if ((major > 4)) || { ((major == 4)) && ((minor >= 1)); }; then
		source <(starship init bash --print-full-init)
	else
		source /dev/stdin <<<"$(starship init bash --print-full-init)"
	fi
}
__main
unset -f __main

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
#determines search program for fzf
if type ag &>/dev/null; then
	export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
fi
#prefer rg over ag
if type rg &>/dev/null; then
	export FZF_DEFAULT_COMMAND='rg --files --hidden'
fi


[ -f $HOME/.asdf/asdf.sh ] && . "$HOME/.asdf/asdf.sh"
[ -f $HOME/.asdf/completions/asdf.bash ] && . "$HOME/.asdf/completions/asdf.bash"
# . "/usr/share/doc/fzf/examples/key-bindings.bash"
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash 
if command -v fzf-share >/dev/null; then
  source "$(fzf-share)/key-bindings.bash"
  source "$(fzf-share)/completion.bash"
fi
# use ctrl-z to toggle in and out of bg
if [[ $- == *i* ]]; then 
  stty susp undef
  bind '"\C-z":" fg\015"'
fi

_z_cd() {
	cd "$@" || return "$?"

	if [ "$_ZO_ECHO" = "1" ]; then
		echo "$PWD"
	fi
}

j() {
	if [ "$#" -eq 0 ]; then
		_z_cd ~
	elif [ "$#" -eq 1 ] && [ "$1" = '-' ]; then
		if [ -n "$OLDPWD" ]; then
			_z_cd "$OLDPWD"
		else
			echo 'zoxide: $OLDPWD is not set'
			return 1
		fi
	else
		_zoxide_result="$(zoxide query -- "$@")" && _z_cd "$_zoxide_result"
	fi
}

ji() {
	_zoxide_result="$(zoxide query -i -- "$@")" && _z_cd "$_zoxide_result"
}

alias ja='zoxide add'

# alias jq='zoxide query'
alias jqi='zoxide query -i'

alias jr='zoxide remove'
jri() {
	_zoxide_result="$(zoxide query -i -- "$@")" && zoxide remove "$_zoxide_result"
}

_zoxide_hook() {
	if [ -z "${_ZO_PWD}" ]; then
		_ZO_PWD="${PWD}"
	elif [ "${_ZO_PWD}" != "${PWD}" ]; then
		_ZO_PWD="${PWD}"
		zoxide add "$(pwd -L)"
	fi
}

case "$PROMPT_COMMAND" in
*_zoxide_hook*) ;;
*) PROMPT_COMMAND="_zoxide_hook${PROMPT_COMMAND:+;${PROMPT_COMMAND}}" ;;
esac

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/Downloads/.anaconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/Downloads/.anaconda/etc/profile.d/conda.sh" ]; then
        . "$HOME/Downloads/.anaconda/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/Downloads/.anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# . ~/.asdf/plugins/dotnet/set-dotnet-env.bash
[ -f ${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/bashrc ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/bashrc"
eval "$(direnv hook bash)"
export DIRENV_LOG_FORMAT=""

# pnpm
export PNPM_HOME="/home/mk489/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
