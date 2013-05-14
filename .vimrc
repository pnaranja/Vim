set nocompatible

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" " required!
Bundle 'gmarik/vundle'
"
" " The bundles you install will be listed here
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'
"

"Use 'F2' to activate NerdTree
noremap <F2> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""
" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)

" Turning off rope so Jedi Vim can be used for autocomplete
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" autofold code
let g:pymode_folding = 1

""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => Pylint settings
" """"""""""""""""""""""""""""""
" Load pylint code plugin
let g:pymode_lint = 1

" " Switch pylint, pyflakes, pep8, mccabe code-checkers
" " Can have multiply values "pep8,pyflakes,mcccabe"
" let g:pymode_lint_checker = "pyflakes,pep8,mccabe"

" " Skip errors and warnings
" " E.g. "E501,W002", "E2,W" (Skip all Warnings and Errors startswith E2) and etc
let g:pymode_lint_ignore = "E501"

" " Select errors and warnings
" " E.g. "E4,W"
" let g:pymode_lint_select = ""

" " Check code every save
let g:pymode_lint_write = 1

" " Auto open cwindow if errors be finded
let g:pymode_lint_cwindow = 1
"
" " Show error message if cursor placed at the error line
let g:pymode_lint_message = 1

" " Place error signs
let g:pymode_lint_signs = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Run Python and Jython script
noremap <F3> :!python %<CR>
noremap <F4> :!jython %<CR>

"Run PDB on Python script
noremap <F5> :!python -i -u -m pdb %<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Recognize jython files as python
au BufNewFile,BufRead *.jy set filetype=python


" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

colorscheme blackboard
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Visual mode related
" """"""""""""""""""""""""""""
" " Visual mode pressing * or # searches for the current selection
" " Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
	
""""""""""""""""""""""""""""""
" => Status line
" """"""""""""""""""""""""""""""
" " Always show the status line
set laststatus=2
"
" " Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" " Disable highlight when <leader><cr> is pressed
noremap <silent> <leader><cr> :noh<cr>

" " Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l
"
" " Close the current buffer
noremap <leader>bd :bd<cr>
"
" " Close all the buffers
noremap <leader>ba :ba<cr>
"
" " Useful mappings for managing tabs
noremap <leader>tn :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>tm :tabmove<cr>

" " Opens a new tab with the current buffer's path
" " Super useful when editing files in the same directory
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
"
" " Switch CWD to the directory of the open buffer
noremap <leader>cd :cd %:p:h<cr>:pwd<cr>
"
" " Specify the behavior when switching between buffers 
try
   set switchbuf=useopen,usetab,newtab
     set stal=2
     catch
     endtry

     " Return to last edit position when opening files (You want this!)
     autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! VisualSelection(direction) range
    let l:saved_reg = @"
        execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
        return ''
endfunction
