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

" Yank to system clipboard
nmap <leader>y "+y
nmap <leader>Y "+Y

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

" Set up tslint as a linter for typescript files
let g:ale_linters = {'typescript': ['eslint']}

" Set up prettier as a fixer for typescript files
let g:ale_fixers = {'typescript': ['prettier']}

" Automatically fix files when saved
let g:ale_fix_on_save = 1

" Whitespace
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent

" Turn off swap files
set noswapfile

" Forced context lines around cursor
set scrolloff=5

" Typescript commands
autocmd FileType typescript nmap <leader>t :TSType<CR>
autocmd FileType typescript nmap <C-]> :TSDef<CR>

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
  call system("new-term --dir $(pwd) -- git rat llll --follow -- " . @% . " &")
endfunction

function! GitLogLines() range
  call system("new-term --dir $(pwd) -- 'git rat llll -L" . a:firstline . "," . a:lastline . ":" . @% . " | diff-highlight' &")
endfunction

function! GitBlame()
  call system("new-term --dir $(pwd) -- git rat blame -- " . @% . " &")
endfunction

function! GitBlameLines() range
  call system("new-term --dir $(pwd) -- git rat blame -L" . a:firstline . "," . a:lastline . " -- " . @% . " &")
endfunction

function! GitDiff() range
  call system("new-term --dir $(pwd) -- 'git rat dl " . @% . " | diff-highlight' &")
endfunction

function! SearchSelection()
  call system("new-term --dir $(pwd) -- search " . getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]-1] . " & ")
endfunction

function! GitLogPickaxe() range
  call system("new-term --dir $(pwd) -- git rat llll -S \\'" . getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]] . "\\' &")
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
