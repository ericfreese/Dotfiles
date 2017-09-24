# Originally from https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/history.zsh

if [ -z "$HISTFILE" ]; then
	HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000

# http://zsh.sourceforge.net/Doc/Release/Options.html#History
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY