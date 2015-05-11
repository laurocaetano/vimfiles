execute pathogen#infect()

" Code complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.rb setlocal spell
autocmd FileType gitcommit setlocal spell
set complete+=kspell

" Autoindent with two spaces
set tabstop=2
set shiftwidth=2
set expandtab

" ctrl-p config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 2
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$'
  \ }
"

" NerdTree
map <C-n> :NERDTreeToggle<CR>

" N command for search
nmap n nzz
nmap N Nzz

set t_Co=256
syntax enable
color Tomorrow-Night

set colorcolumn=80

set nu " Line numbers on

" Ignore case in searches
set ignorecase

" copy selection to the clipboard
vmap <Leader>cp :w !pbcopy<CR><CR>

" Spellcheck for Markdown files
autocmd BufNewFile,BufRead *.md set spelllang=en spell filetype=markdown

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

" Plugin and indentation on
filetype plugin indent on

autocmd BufWritePre * :%s/\s\+$//e
