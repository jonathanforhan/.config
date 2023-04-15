# .bashrc

if [[ $- != *i* ]] ; then
    # Shell is non-interactive.  Be done now!
    return
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
. "$HOME/.cargo/env"

# Tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

#Config
export PS1="\[\033[38;5;41m\]\u@\h\[$(tput sgr0)\]:[\[$(tput sgr0)\]\[\033[38;5;39m\]\W\[$(tput sgr0)\]]\\$ \[$(tput sgr0)\]"

#Paths
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.scripts/cmaker:$PATH"
export GOPATH="$HOME/.go"
export PATH="$HOME/.local/lib/depot_tools:$PATH"
export PATH="/usr/bin/ninja:$PATH"
export PATH="/home/jon/.perl5/bin${PATH:+:${PATH}}";
export PERL5LIB="/home/jon/.perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}";
export PERL_LOCAL_LIB_ROOT="/home/jon/.perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}";
export PERL_MB_OPT="--install_base \"/home/jon/.perl5\"";
export PERL_MM_OPT="INSTALL_BASE=/home/jon/.perl5";
[ -f "/home/jon/.ghcup/env" ] && source "/home/jon/.ghcup/env" # ghcup-env

#Aliases
alias v='nvim'
alias ls='ls --color=auto'
alias l='LC_COLLATE=C ls -l'
alias ll='LC_COLLATE=C ls -la'
alias teamviewer='teamviewer & disown && sleep 1 && cd .'
alias py='python3'
alias vconf='nvim ~/.config/nvim/lua/user/'
alias tconf='nvim ~/.tmux.conf'
alias bashrc='nvim ~/.bashrc'
