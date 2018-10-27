" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Moving around, tabs and buffers
"    -> Custom mappings
"    -> Plugins configuration

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin on
au BufRead,BufNewFile *.html setfiletype html.twig
au BufRead,BufNewFile *.html.arb setfiletype ruby
set nocompatible                                              " Makes vim behave in a more useful way than vi
set number                                                    " Line numbers
set ttyfast                                                   " Improve drawing
set lazyredraw                                                " Do not redraw while running macros
set autoread                                                  " Set to auto read when a file is changed from the outside
set bs=2                                                      " Fix backspace issues
set list                                                      " See invisible characters
set t_Co=256                                                  " Specifies that the terminal can support 256 colors

let mapleader = ","                                           " With a map leader it's possible to do extra key combinations

" Memory
set history=1000
set undolevels=1000
set maxmem=2000000
set maxmemtot=2000000
set tags=~/.vim/tags/dailymotion

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Scrolling
set scrolloff=3
set scrolljump=3

" Wild menu
set wildmenu
set wildmode=list:longest,full

" Visual options
set ruler                                                     " Show line cursor info
set cursorline
set cmdheight=1                                               " Command bar height
set linebreak
"
" For at least vim >= 7.4.338
if v:version > 704 || v:version == 704 && has('patch338')
  set breakindent
endif

" Set backspace configuration
set ww=b,s,<,>

set hlsearch                                                  " Highlight search words
set ignorecase                                                " Ignore search case
"set incsearch                                                 " Make search act like search in modern browsers
set magic                                                     " For regular expressions
set showmatch                                                 " Show matching braces when text indicator is over them

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

set grepprg=git\ grep\ -n\ $*

" Character to precede line wraps
" Using let instead of set to be able to use quotes
let &showbreak='âª '

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on                                                     " Syntax coloration
colorscheme darkburn
set encoding=utf-8                                             " Characters encoding
"set encoding=latin1
"set encoding=unicode
set ffs=unix,dos,mac                                          " Set folding format to prevent from bad carriage return

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Backup on
set backup
set writebackup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Backup off
"set nobackup
"set nowb
"set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Indentation
set autoindent                                                " Auto indent
set smartindent                                               " Smart indent
"set nowrap                                                    " No wrap lines

" Tabs
set softtabstop=2                                             " Tab width
set tabstop=2                                                 " Tab width
set shiftwidth=2                                              " Indent width
set expandtab                                                 " Use whitespace instead of tab

" Columns
set tw=80
set formatoptions+=t

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Switch to the next buffer
nmap <Tab> :bn<Enter>
" Switch to the previous buffer
nmap <S-Tab> :bp<Enter>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> yo  :set paste<cr>o
nnoremap <silent> yO  :set paste<cr>O

" Autocompletion
function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    elseif pumvisible()
        return "\<c-n>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction

" <C-R> explained:
" You can insert the result of a Vim expression in insert mode using the <C-R>=
" command. For example, the following command creates an insert mode map command
" that inserts the current directory:
" :inoremap <F2> <C-R>=expand('%:p:h')<CR>
inoremap <Tab> <C-R>=SuperCleverTab()<cr>

" http://vim.wikia.com/wiki/Selecting_your_pasted_text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""
" Vundle "
""""""""""
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" original repos on github
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'inside/vim-grep-operator'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/unite-outline'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'inside/vim-search-pulse'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'othree/html5.vim'
Plugin 'kchmck/vim-coffee-script'

" vim-scripts repos
Plugin 'Syntastic'
Plugin 'camelcasemotion'
Plugin 'CursorLineCurrentWindow'

call vundle#end()
filetype plugin indent on    " required

"""""""""""""""
" delimitMate "
"""""""""""""""
let delimitMate_expand_cr = 1

""""""""""""
" NERDTree "
""""""""""""
map <C-n> :NERDTreeToggle<CR>

""""""""""""""
" Tabularize "
""""""""""""""
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>

"""""""""""""""""""""
" vim-grep-operator "
"""""""""""""""""""""
nmap <leader>g <Plug>GrepOperatorOnCurrentDirectory
vmap <leader>g <Plug>GrepOperatorOnCurrentDirectory
nmap <leader><leader>g <Plug>GrepOperatorWithFilenamePrompt
vmap <leader><leader>g <Plug>GrepOperatorWithFilenamePrompt
let g:grep_operator = 'Ag'
let g:grep_operator_set_search_register = 1

""""""""""
" Unite  "
""""""""""
let g:unite_source_file_rec_max_cache_files = 100000
let g:unite_source_rec_async_command =
\ ['ag', '--follow', '--nocolor', '--nogroup', '--hidden',  '-g', '']
nnoremap <silent> <leader>f
            \ :<c-u>Unite
            \ -no-split -buffer-name=files -start-insert
            \ file_rec/async<cr>

function! s:unite_settings()
    imap <buffer> <c-c> <Plug>(unite_exit)
    nmap <buffer> <c-c> <Plug>(unite_exit)
    nmap <buffer> <esc> <Plug>(unite_exit)
    imap <buffer> <c-r> <Plug>(unite_redraw)
    nmap <buffer> <c-r> <Plug>(unite_redraw)
    imap <buffer> <c-j> <Plug>(unite_select_next_line)
    imap <buffer> <c-k> <Plug>(unite_select_previous_line)
endfunction

""""""""""""""""
"  vim airline "
""""""""""""""""
set laststatus=2   " enable vim-airline without splitting vim
let g:airline#extensions#syntastic#enabled=0
let g:airline_powerline_fonts=0
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '¶ '

"""""""""""""
" Syntastic "
"""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers = ['php']
let g:syntastic_coffee_checkers = ['coffee']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = {'passive_filetypes': ['html']}

"""""""""""""""
" autocommand "
"""""""""""""""
augroup mygroup
" clear the group's autocommand
    autocmd!
    autocmd FileType unite call s:unite_settings()

    " Disables paste mode when leaving insert mode
    autocmd InsertLeave *
                \ if &paste == 1 |
                \     set nopaste |
                \ endif

    " remove trailing space when saving file
    autocmd BufWritePre * :FixWhitespace
augroup END
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Moving around, tabs and buffers
"    -> Custom mappings
"    -> Plugins configuration

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin on
au BufRead,BufNewFile *.html setfiletype html.twig
au BufRead,BufNewFile *.html.arb setfiletype ruby
set nocompatible                                              " Makes vim behave in a more useful way than vi
set number                                                    " Line numbers
set ttyfast                                                   " Improve drawing
set lazyredraw                                                " Do not redraw while running macros
set autoread                                                  " Set to auto read when a file is changed from the outside
set bs=2                                                      " Fix backspace issues
set list                                                      " See invisible characters
set t_Co=256                                                  " Specifies that the terminal can support 256 colors

let mapleader = ","                                           " With a map leader it's possible to do extra key combinations

" Memory
set history=1000
set undolevels=1000
set maxmem=2000000
set maxmemtot=2000000
set tags=~/.vim/tags/dailymotion

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Scrolling
set scrolloff=3
set scrolljump=3

" Wild menu
set wildmenu
set wildmode=list:longest,full

" Visual options
set ruler                                                     " Show line cursor info
set cursorline
set cmdheight=1                                               " Command bar height
set linebreak
"
" For at least vim >= 7.4.338
if v:version > 704 || v:version == 704 && has('patch338')
  set breakindent
endif

" Set backspace configuration
set ww=b,s,<,>

set hlsearch                                                  " Highlight search words
set ignorecase                                                " Ignore search case
"set incsearch                                                 " Make search act like search in modern browsers
set magic                                                     " For regular expressions
set showmatch                                                 " Show matching braces when text indicator is over them

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

set grepprg=git\ grep\ -n\ $*

" Character to precede line wraps
" Using let instead of set to be able to use quotes
let &showbreak='âª '

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on                                                     " Syntax coloration
colorscheme darkburn
set encoding=utf-8                                             " Characters encoding
"set encoding=latin1
"set encoding=unicode
set ffs=unix,dos,mac                                          " Set folding format to prevent from bad carriage return

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Backup on
set backup
set writebackup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Backup off
"set nobackup
"set nowb
"set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Indentation
set autoindent                                                " Auto indent
set smartindent                                               " Smart indent
"set nowrap                                                    " No wrap lines

" Tabs
set softtabstop=2                                             " Tab width
set tabstop=2                                                 " Tab width
set shiftwidth=2                                              " Indent width
set expandtab                                                 " Use whitespace instead of tab

" Columns
set tw=80
set formatoptions+=t

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Switch to the next buffer
nmap <Tab> :bn<Enter>
" Switch to the previous buffer
nmap <S-Tab> :bp<Enter>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> yo  :set paste<cr>o
nnoremap <silent> yO  :set paste<cr>O

" Autocompletion
function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    elseif pumvisible()
        return "\<c-n>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction

" <C-R> explained:
" You can insert the result of a Vim expression in insert mode using the <C-R>=
" command. For example, the following command creates an insert mode map command
" that inserts the current directory:
" :inoremap <F2> <C-R>=expand('%:p:h')<CR>
inoremap <Tab> <C-R>=SuperCleverTab()<cr>

" http://vim.wikia.com/wiki/Selecting_your_pasted_text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""
" Vundle "
""""""""""
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" original repos on github
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'inside/vim-grep-operator'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/unite-outline'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'inside/vim-search-pulse'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'othree/html5.vim'
Plugin 'kchmck/vim-coffee-script'

" vim-scripts repos
Plugin 'Syntastic'
Plugin 'camelcasemotion'
Plugin 'CursorLineCurrentWindow'

call vundle#end()
filetype plugin indent on    " required

"""""""""""""""
" delimitMate "
"""""""""""""""
let delimitMate_expand_cr = 1

""""""""""""
" NERDTree "
""""""""""""
map <C-n> :NERDTreeToggle<CR>

""""""""""""""
" Tabularize "
""""""""""""""
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>

"""""""""""""""""""""
" vim-grep-operator "
"""""""""""""""""""""
nmap <leader>g <Plug>GrepOperatorOnCurrentDirectory
vmap <leader>g <Plug>GrepOperatorOnCurrentDirectory
nmap <leader><leader>g <Plug>GrepOperatorWithFilenamePrompt
vmap <leader><leader>g <Plug>GrepOperatorWithFilenamePrompt
let g:grep_operator = 'Ag'
let g:grep_operator_set_search_register = 1

""""""""""
" Unite  "
""""""""""
let g:unite_source_file_rec_max_cache_files = 100000
let g:unite_source_rec_async_command =
\ ['ag', '--follow', '--nocolor', '--nogroup', '--hidden',  '-g', '']
nnoremap <silent> <leader>f
            \ :<c-u>Unite
            \ -no-split -buffer-name=files -start-insert
            \ file_rec/async<cr>

function! s:unite_settings()
    imap <buffer> <c-c> <Plug>(unite_exit)
    nmap <buffer> <c-c> <Plug>(unite_exit)
    nmap <buffer> <esc> <Plug>(unite_exit)
    imap <buffer> <c-r> <Plug>(unite_redraw)
    nmap <buffer> <c-r> <Plug>(unite_redraw)
    imap <buffer> <c-j> <Plug>(unite_select_next_line)
    imap <buffer> <c-k> <Plug>(unite_select_previous_line)
endfunction

""""""""""""""""
"  vim airline "
""""""""""""""""
set laststatus=2   " enable vim-airline without splitting vim
let g:airline#extensions#syntastic#enabled=0
let g:airline_powerline_fonts=0
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '¶ '

"""""""""""""
" Syntastic "
"""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers = ['php']
let g:syntastic_coffee_checkers = ['coffee']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = {'passive_filetypes': ['html']}

"""""""""""""""
" autocommand "
"""""""""""""""
augroup mygroup
" clear the group's autocommand
    autocmd!
    autocmd FileType unite call s:unite_settings()

    " Disables paste mode when leaving insert mode
    autocmd InsertLeave *
                \ if &paste == 1 |
                \     set nopaste |
                \ endif

    " remove trailing space when saving file
    autocmd BufWritePre * :FixWhitespace
augroup END
