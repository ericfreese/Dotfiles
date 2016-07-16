_abbreviated_cwd() {
  # Abbreviate "/Users/ericfreese/Code/some_project/lib" => "~/C/s/lib"
  echo "${PWD/#$HOME/~}" | sed 's/\([^\/]\)[^\/][^\/]*\//\1\//g'
}

_git_status() {
  precmd_update_git_vars

  if [ -n "$__CURRENT_GIT_STATUS" ]; then
    # Current branch
    local _current_branch="$ZSH_THEME_GIT_PROMPT_BRANCH$GIT_BRANCH%{${reset_color}%}"

    # Upstream info
    local _upstream_info=''
    [ "$GIT_AHEAD" -ne "0" ] && _upstream_info="$_upstream_info$ZSH_THEME_GIT_PROMPT_AHEAD$GIT_AHEAD%{${reset_color}%}"
    [ "$GIT_BEHIND" -ne "0" ] && _upstream_info="$_upstream_info$ZSH_THEME_GIT_PROMPT_BEHIND$GIT_BEHIND%{${reset_color}%}"

    # Working copy info
    local _working_copy_info
    [ "$GIT_CONFLICTS" -ne "0" ] && _working_copy_info="$_working_copy_info$ZSH_THEME_GIT_PROMPT_CONFLICTS$GIT_CONFLICTS%{${reset_color}%}"
    [ "$GIT_STAGED" -ne "0" ] && _working_copy_info="$_working_copy_info$ZSH_THEME_GIT_PROMPT_STAGED$GIT_STAGED%{${reset_color}%}"
    [ "$GIT_CHANGED" -ne "0" ] && _working_copy_info="$_working_copy_info$ZSH_THEME_GIT_PROMPT_CHANGED$GIT_CHANGED%{${reset_color}%}"
    [ "$GIT_UNTRACKED" -ne "0" ] && _working_copy_info="$_working_copy_info$ZSH_THEME_GIT_PROMPT_UNTRACKED$GIT_UNTRACKED%{${reset_color}%}"
    if [ "$GIT_CHANGED" -eq "0" ] && [ "$GIT_CONFLICTS" -eq "0" ] && [ "$GIT_STAGED" -eq "0" ] && [ "$GIT_UNTRACKED" -eq "0" ]; then
      _working_copy_info="$_working_copy_info$ZSH_THEME_GIT_PROMPT_CLEAN%{${reset_color}%}"
    fi

    # Build the final status
    local _status=()
    _status+=("$_current_branch")
    [ -n "$_upstream_info" ] && _status+=($_upstream_info)
    [ -n "$_working_copy_info" ] && _status+=($_working_copy_info)
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$_status$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

_prompt() {
  local last_status=$?

  # Working directory
  local abbreviated_cwd="%{$fg[blue]%}$(_abbreviated_cwd)%{$reset_color%}"

  # Git status
  local git_status=$(_git_status)

  # Arrow
  local arrow
  if [ $last_status -eq 0 ]; then
    arrow="%{$FG[008]%}❯%{$reset_color%}"
  else
    arrow="%{$fg[red]%}❯%{$reset_color%}"
  fi

  local _items=()
  _items+=("$abbreviated_cwd")
  [ -n "$git_status" ] && _items+=("$git_status")
  _items+=("$arrow")

  echo " $_items "
}

ZSH_THEME_GIT_PROMPT_BRANCH="%{$FG[008]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[cyan]%}%{✻%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{×%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[blue]%}%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[blue]%}%{↑%G%}"

PROMPT='$(_prompt)'
