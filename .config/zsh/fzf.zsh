function fuzzy-open-file() {
	local filepath
	filepath="$(find -L . | fzf)"

	if [ $#filepath -gt 0 ]; then
		BUFFER="vim $filepath"
		zle .accept-line
	fi
}

zle -N fuzzy-open-file
bindkey ^O fuzzy-open-file
