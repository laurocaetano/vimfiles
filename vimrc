execute pathogen#infect()

" Code complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

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
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"
" NerdTree
map <C-n> :NERDTreeToggle<CR>

" N command for search
nmap n nzz
nmap N Nzz

" Solarized theme
syntax enable
set background=light
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

"Move lines up and down
nmap <C-Up> ddkP
nmap <C-Down> ddp

set colorcolumn=80
set nu " Line numbers on

" Ignore case in searches
set ignorecase

" Reload the .vimrc after save
autocmd! bufwritepost .vimrc source %

" copy selection to the clipboard
vmap <Leader>cp :w !pbcopy<CR><CR>

" No spellcheck for Markdown files
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

" Tabular
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

set list listchars=tab:»·,trail:·

map <leader>= :call TrimWhiteSpace()<CR>
map! <leader>= :call TrimWhiteSpace()<CR>

" Plugin and indentation on
filetype plugin indent on

autocmd BufWritePre * :%s/\s\+$//e