ZSH_DIR=~/.config/zsh

export PATH="$HOME/bin:$PATH"
export VISUAL="vim"
bindkey -e

source "$ZSH_DIR/opts.zsh"
source "$ZSH_DIR/history.zsh"
source "$ZSH_DIR/plugins.zsh"
source "$ZSH_DIR/prompt.zsh"
source "$ZSH_DIR/aliases.zsh"
source "$ZSH_DIR/bindings.zsh"

source "$ZSH_DIR/golang.zsh"
#source "$ZSH_DIR/chruby.zsh"
source "$ZSH_DIR/fzf.zsh"
#source "$ZSH_DIR/autosuggestions.zsh"
#source "$ZSH_DIR/golang.zsh"
#source "$ZSH_DIR/homebrew.zsh"
source "$ZSH_DIR/less.zsh"
#source "$ZSH_DIR/nvm.zsh"
