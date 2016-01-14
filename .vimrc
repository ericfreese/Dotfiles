set shell=/bin/sh
set t_Co=256
set nocompatible

set encoding=utf-8

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
"Plugin 'scrooloose/nerdtree'

"Plugin 'jpo/vim-railscasts-theme'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'vim-ruby/vim-ruby'
Plugin 'Lokaltog/vim-distinguished'

call vundle#end()
filetype plugin indent on
syntax on

colorscheme distinguished
"set background=dark
"hi Normal ctermbg=none


set list listchars=tab:»•,trail:•,nbsp:•

" The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif
