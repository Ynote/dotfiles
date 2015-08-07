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
set softtabstop=2                                             " Largeur d'une tabulation
set tabstop=2                                                 " Largeur d'une tabulation
set shiftwidth=2                                              " Largeur de l'indentation
set expandtab                                                 " Utilise des espaces plutot que le caractere tabulation

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

" Tabularize
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>

" Search pulse
nmap n n<Plug>PulseCursorLine
nmap N N<Plug>PulseCursorLine
nmap * *<Plug>PulseCursorLine
nmap # #<Plug>PulseCursorLine
" Pulses cursor line on first match when doing search with / or ?
" cmap <enter> <Plug>PulseFirst

" http://vim.wikia.com/wiki/Selecting_your_pasted_text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
let g:syntastic_mode_map = {'passive_filetypes': ['html']}
let g:syntastic_javascript_jshint_args =
    \ '--config /home/fanny/dailymotion/scripts/git/jshint-conf.json'


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
Plugin 'kmnk/vim-unite-giti'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'CursorLineCurrentWindow'
Plugin 'inside/vim-search-pulse'
Plugin 'kchmck/vim-coffee-script'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'othree/html5.vim'
Plugin 'evidens/vim-twig'
Plugin 'digitaltoad/vim-jade'


" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'Syntastic'
Plugin 'camelcasemotion'

call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""
" delimitMate "
"""""""""""""""
let delimitMate_expand_cr = 1

"""""""""""""""""""""
" vim-grep-operator "
"""""""""""""""""""""
nmap <leader>g <Plug>GrepOperatorOnCurrentDirectory
vmap <leader>g <Plug>GrepOperatorOnCurrentDirectory
nmap <leader><leader>g <Plug>GrepOperatorWithFilenamePrompt
vmap <leader><leader>g <Plug>GrepOperatorWithFilenamePrompt

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

""""""""""
" Unite  "
""""""""""
let g:unite_source_file_rec_max_cache_files = 100000
let g:unite_source_rec_async_command =
            \ 'ag --follow --nocolor --nogroup --hidden -g ""'
nnoremap <silent> <F11>
            \ :<c-u>Unite
            \ -no-split -buffer-name=files -start-insert
            \ file_rec/async<cr>
nnoremap <silent> <leader>fb
            \ :<c-u>Unite
            \ -no-split -buffer-name=buffers -start-insert
            \ buffer<cr>
nnoremap <silent> <leader>fo
            \ :<c-u>Unite
            \ -no-split -buffer-name=outline -start-insert
            \ outline<cr>
nnoremap <silent> <leader>fl
            \ :<c-u>Unite
            \ -no-split -buffer-name=lines -start-insert
            \ line<cr>

function! s:unite_settings()
    imap <buffer> <c-c> <Plug>(unite_exit)
    nmap <buffer> <c-c> <Plug>(unite_exit)
    nmap <buffer> <esc> <Plug>(unite_exit)
    imap <buffer> <F5> <Plug>(unite_redraw)
    nmap <buffer> <F5> <Plug>(unite_redraw)
    imap <buffer> <c-j> <Plug>(unite_select_next_line)
    imap <buffer> <c-k> <Plug>(unite_select_previous_line)
endfunction

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
