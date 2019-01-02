set number

" PaperColor color scheme
set background=dark
colorscheme PaperColor

" Update git-gutter in realtime
set updatetime=0

" Visualize tabs and trailing spaces
set list
set listchars=tab:>-,trail:-

" Leader
let mapleader=" "

" Open file via fzf
nmap <leader>pp :FZF<CR>

" Buffer navigation
set hidden
nmap <C-n> :bnext<CR>
nmap <C-p> :bprevious<CR>
nmap <C-c> :bdelete<CR>

" Show modified files differently in BufTabLine (requires EvanPurkhiser fork)
autocmd ColorScheme * hi BufTabLineModified cterm=NONE ctermfg=Black ctermbg=Red

" Show buffer number in tabline
let g:buftabline_numbers = 1

" Show modified status (+ if modifed) in tabline
let g:buftabline_indicators = 1

" Whitespace
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent

" Forced context lines around cursor
set scrolloff=5
