# .bashrc

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

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

if [ -f ~/.config/.bash_aliases ]; then
    . "$HOME/.config/bash_aliases"
fi

export PS1="\[\033[38;5;41m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;41m\]\h\[$(tput sgr0)\]:[\[$(tput sgr0)\]\[\033[38;5;39m\]\W\[$(tput sgr0)\]]\\$ \[$(tput sgr0)\]"
export EDITOR="nvim"
export GPG_TTY=$(tty) # gpg git-credential key

eval "$(perl -I$HOME/.local/share/perl5/lib/perl5 -Mlocal::lib=$HOME/.local/share/perl5)"
