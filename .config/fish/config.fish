set -g -x fish_greeting ''

##
# Fundle
#

fundle plugin 'oh-my-fish/plugin-foreign-env'

fundle init

##
# Homebrew
#

set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"

##
# Initialize chruby
#

source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish

##
# Initialize NVM
#

fenv source ~/.nvm/nvm.sh > /dev/null

##
# Aliases
#

alias ls='ls -G'
alias ll='ls -alG'
alias st='subl -n'
alias tigs='tig status'

alias be='bundle exec'
alias bi='bundle install'
alias brc='be rails c'
alias brs='be rails s'
alias brdm='be rake db:migrate'
alias brt='be rake test'
alias bfs='be foreman start'

##
# Git prompt
#

set __fish_git_prompt_showdirtystate          'yes'
set __fish_git_prompt_showuntrackedfiles      'yes'
set __fish_git_prompt_showstashstate          ''
set __fish_git_prompt_showupstream            'yes'
set __fish_git_prompt_show_informative_status 'yes'

set __fish_git_prompt_color_cleanstate        green
set __fish_git_prompt_color_stagedstate       green
set __fish_git_prompt_color_dirtystate        cyan
set __fish_git_prompt_color_untrackedfiles    red
set __fish_git_prompt_color_invalidstate      red
set __fish_git_prompt_color_stashstate        --bold blue
set __fish_git_prompt_color_branch            999
set __fish_git_prompt_color_upstream          blue

set __fish_git_prompt_char_stateseparator     ' '

set __fish_git_prompt_char_cleanstate         '✔'
set __fish_git_prompt_char_stagedstate        '●'
set __fish_git_prompt_char_dirtystate         '✻'
set __fish_git_prompt_char_untrackedfiles     '+'
set __fish_git_prompt_char_invalidstate       '✗'
set __fish_git_prompt_char_stashstate         '$'

set __fish_git_prompt_char_upstream_prefix    ' '
set __fish_git_prompt_char_upstream_ahead     '▲'
set __fish_git_prompt_char_upstream_behind    '▼'
set __fish_git_prompt_char_upstream_equal     ''
set __fish_git_prompt_char_upstream_diverged  ''

##
# Dotfiles config
#

set DOTLIFY_PATH ~/Dotfiles
