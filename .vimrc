execute pathogen#infect()

" Update git-gutter in realtime
set updatetime=0

" Whitespace
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent

" Turn on mouse support
set mouse=a

" Use the xorg system clipboard as default register
set clipboard=unnamedplus

" Turn off swap files
set noswapfile

" Turn on syntax highlighting
syntax on

" Color scheme
set background=dark
colorscheme PaperColor
hi Search cterm=NONE ctermfg=DarkCyan ctermbg=Cyan
"hi Normal ctermbg=NONE
"hi NonText ctermbg=NONE
"hi LineNr ctermbg=NONE

" Show matching brackets
set showmatch

" Turn on line numbers
set number

" Incremental search
set incsearch

" Highlight search results
set hlsearch

" Forced context lines around cursor
set scrolloff=5

" Turn on filetype detection, plugins, and indentation
filetype plugin indent on

" Highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Visualize tabs and trailing spaces
set list
set listchars=tab:>-,trail:-

" Keep undo history across sessions by storing it in a file
set undodir=$HOME/.vim/undo
set undofile

" Leader
let mapleader=" "

" Window/buffer navigation
nmap <C-h> :wincmd h<CR>
nmap <C-j> :wincmd j<CR>
nmap <C-k> :wincmd k<CR>
nmap <C-l> :wincmd l<CR>
"nmap <leader>T :enew<CR>
nmap <C-n> :bnext<CR>
nmap <C-p> :bprevious<CR>
nmap <C-c> :bp <BAR> bd #<CR>

" Git Gutter
let g:gitgutter_map_keys = 0

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" NERDTree
map <leader>nn :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>

" CtrlP
let g:ctrlp_map = '<leader>pp'
let g:ctrlp_cmd = 'CtrlPMixed'
map <leader>pb :CtrlPBuffer<CR>

" Golang
let g:go_fmt_command = "goimports"

" Highlight other occurences of word under cursor
autocmd CursorMoved * exe printf('match MatchParen /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" External commands
function! GitHubOpen()
  call system("xdg-open $(git hub-url --file \"". @% . "\") &")
endfunction

function! GitHubOpenLines() range
  call system("xdg-open $(git hub-url --file \"". @% . "\" --first-line " . a:firstline . " --last-line " . a:lastline . ") &")
endfunction

function! GitHubCopyUrl()
  call system("git hub-url --file \"". @% . "\" | clip --notify &")
endfunction

function! GitHubCopyUrlLines() range
  call system("git hub-url --file \"". @% . "\" --first-line " . a:firstline . " --last-line " . a:lastline . " | clip --notify &")
endfunction

function! GitLog()
  call system("new-term --dir $(xcwd) -- git rat llll --follow -- " . @% . " &")
endfunction

function! GitLogLines() range
  call system("new-term --dir $(xcwd) -- 'git rat llll -L" . a:firstline . "," . a:lastline . ":" . @% . " | diff-highlight' &")
endfunction

function! GitBlame()
  call system("new-term --dir $(xcwd) -- git rat blame -- " . @% . " &")
endfunction

function! GitBlameLines() range
  call system("new-term --dir $(xcwd) -- git rat blame -L" . a:firstline . "," . a:lastline . " -- " . @% . " &")
endfunction

function! GitDiff() range
  call system("new-term --dir $(xcwd) -- 'git rat dl " . @% . " | diff-highlight' &")
endfunction

function! SearchSelection()
  call system("new-term --dir $(xcwd) -- search " . getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]] . " & ")
endfunction

function! GitLogPickaxe() range
  call system("new-term --dir $(xcwd) -- git rat llll -S \\'" . getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]] . "\\' &")
endfunction

nnoremap <leader>gO :call GitHubOpen()<CR>
vnoremap <leader>gO :call GitHubOpenLines()<CR>

nnoremap <leader>gY :call GitHubCopyUrl()<CR>
vnoremap <leader>gY :call GitHubCopyUrlLines()<CR>

nnoremap <leader>gL :call GitLog()<CR>
vnoremap <leader>gL :call GitLogLines()<CR>

nnoremap <leader>gB :call GitBlame()<CR>
vnoremap <leader>gB :call GitBlameLines()<CR>

nnoremap <leader>gD :call GitDiff()<CR>

vnoremap <leader>ss :call SearchSelection()<CR>
vnoremap <leader>gS :call GitLogPickaxe()<CR>
