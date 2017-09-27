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

