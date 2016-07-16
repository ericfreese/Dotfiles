# source ~/.oh-my-zsh.zshrc


ZSH_DIR=~/.zsh

source "$ZSH_DIR/opts.zsh"
source "$ZSH_DIR/history.zsh"
source "$ZSH_DIR/antigen.zsh"
source "$ZSH_DIR/prompt.zsh"
source "$ZSH_DIR/homebrew.zsh"
source "$ZSH_DIR/nvm.zsh"
source "$ZSH_DIR/chruby.zsh"
source "$ZSH_DIR/golang.zsh"
source "$ZSH_DIR/aliases.zsh"
source "$ZSH_DIR/bindings.zsh"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'

source ~/.zsh/zaw/zaw.zsh

# source ~/Code/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/Code/zsh-autosuggestions/zsh-autosuggestions.zsh
# bindkey '^ ' autosuggest-accept
# # bindkey '^M' autosuggest-execute
# ZSH_AUTOSUGGEST_EXECUTE_WIDGETS+=(accept-line)

# source ~/Code/zsh-sqlite-history/zsh-sqlite-history.zsh


# SAVEHIST=1000
# HISTSIZE=1000
# setopt SHARE_HISTORY
# setopt EXTENDED_HISTORY

# _echo_time() {
# 	echo $(date +%s)
# }

# autoload -Uz add-zsh-hook
# add-zsh-hook zshaddhistory _echo_time


# HISTFILE=~/.zshtmphist
# SAVEHIST=1000
# HISTSIZE=1000
# source ~/Code/zsh-prioritize-cwd-history/zsh-prioritize-cwd-history.zsh

# PROMPT='%# '
