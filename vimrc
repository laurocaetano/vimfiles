" Forcing the use of hjkl keys to navigate
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

set list listchars=tab:»·,trail:·

set nocompatible     " be iMproved, required
set number           " shows line numbers
set hlsearch         " highlight search results
set cursorline       " highlight cursor line
set wildmode=list    " expand and folders/tabs when opening a file
set backspace=2      " makes backspace work as it should work
set mouse=a

" Spell checker
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell
set complete+=kspell

let mapleader=","

" NerdTree
map <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <C-\> :NERDTreeFind<CR>:vertical<CR>
let NERDTreeIgnore = ['build$']

" N command for search
nmap n nzz
nmap N Nzz

" Set indentation
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Set folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

" scrolling
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" search
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set smartcase       " ...unless we type a capital

"Move back and forth through previous and next buffers
"with ,z and ,x
nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>

" opens/closes folds
nnoremap <Space> za

" ,q to toggle quickfix window (where you have stuff like Ag)
" ,oq to open it back up (rare)
nmap <silent> ,qc :cclose<CR>
nmap <silent> ,qo :copen<CR>

function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" shortcuts for changing windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Tagbar
nmap <F9> :TagbarToggle<CR>

" The Silver Searcher
" Inspired by http://robots.thoughtbot.com/faster-grepping-in-vim/
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --path-to-agignore\ $HOME/.agignore

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " bind K to grep word under cursor
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

  " bind , (backward slash) to grep shortcut
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

  map <Leader>f :Ag<SPACE>
endif

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
