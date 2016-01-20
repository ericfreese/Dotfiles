# For ericfreese/zsh-autosuggest plugin

zle-line-init() {
  autosuggest_start
}

zle -N zle-line-init

AUTOSUGGEST_HIGHLIGHT_COLOR="fg=240"

