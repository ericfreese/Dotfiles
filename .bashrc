#!/bin/bash

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export HISTSIZE=1000
export HISTFILESIZE=2000

alias ls="ls -G"
alias ll="ls -alG"
alias hgr="h | grep"
alias st="subl -n"

alias be="bundle exec"
alias bi="bundle install"
alias brc="be rails c"
alias brdm="be rake db:migrate"
alias brt="be rake test"
alias bfs="be foreman start"

# Prompt
PS1=$' \W \\[\e[32m\\]\xc2\xbb\\[\e[0m\\] '

# For git autocompletion
source /usr/local/etc/bash_completion.d/git-completion.bash

# export NODE_PATH=/usr/local/lib/node_modules
export NODE_PATH=/usr/local/share/npm/lib/node_modules

# Prioritize /usr/local/bin
# PATH="/usr/local/bin:/usr/local/share/npm/bin:$PATH"

# To enable rbenv shims and autocompletion
# eval "$(rbenv init -)"

# To enable chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# Install homebrew cask opts to /Applications instead of ~/Applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
