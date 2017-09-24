bindkey '\e[3~' delete-char

bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line

function autosuggest_accept_or_expand() {
	if [ -n "$POSTDISPLAY" ]; then
		zle -w autosuggest-accept
	else
		zle -w expand-or-complete
	fi
}

zle -N autosuggest_accept_or_expand

bindkey '^ ' autosuggest_accept_or_expand
