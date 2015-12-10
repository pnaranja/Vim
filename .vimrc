set nocompatible

call plug#begin('~/.vim/bundle')
Plug 'scrooloose/syntastic'
Plug 'davidhalter/jedi-vim'
Plug 'kien/ctrlp.vim'
Plug 'rosenfeld/conque-term' 
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'flazz/vim-colorschemes'
Plug 'luochen1990/rainbow'
Plug 'bling/vim-airline'
Plug 'https://git::@github.com/kovisoft/paredit'
Plug 'Valloric/YouCompleteMe' , { 'do': './install.py --clang-completer' }

Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'

Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }

" Searching
Plug 'mileszs/ack.vim'

" For particular programming languages
Plug 'klen/python-mode' , { 'for' : 'python' }

Plug 'guns/vim-clojure-static' , { 'for' : 'clojure' }
Plug 'guns/vim-clojure-highlight' , { 'for' : 'clojure' }
Plug 'tpope/vim-leiningen' , { 'for' : 'clojure' }
Plug 'tpope/vim-fireplace' , { 'for' : 'clojure' }
Plug 'guns/vim-sexp', { 'for' : 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people' , { 'for' : 'clojure' }
Plug 'venantius/vim-eastwood',  { 'for' : 'clojure' }

Plug 'jelera/vim-javascript-syntax' ,{ 'for' : 'javascript' } 
Plug 'pangloss/vim-javascript' , { 'for' : 'javascript' }
Plug 'moll/vim-node' , { 'for' : 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim' , { 'for' : 'javascript' }
Plug 'ternjs/tern_for_vim' , { 'for' : 'javascript' }

Plug 'othree/html5.vim' , { 'for' : 'html' }
Plug 'othree/html5-syntax.vim' , { 'for' : 'html' }

Plug 'wting/rust.vim' , { 'for' : 'rust' }

Plug 'neovimhaskell/haskell-vim' , { 'for' : 'haskell' }

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <leader> is <space> and comma
let mapleader = ","
let g:mapleader = ","
noremap <space> <Nop>
map <space> <leader>

" Use ; for commands
noremap ; :

" Sets how many lines of history VIM has to remember
set history=700

" Enable line numbers
set nu

" Enable filetype plugins
filetype plugin on
filetype indent on

" Recognize jython files as python
au BufNewFile,BufRead *.jy set filetype=python


" Set to auto read when a file is changed from the outside
set autoread

" Set current working directory as the file that is open
autocmd BufEnter * silent! lcd %:p:h

" Fast saving
noremap <leader>w :w<cr>

" Select all
noremap <leader>sa 1GVG

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Quick open of the vimrc file
noremap <leader>v :e $MYVIMRC<CR>

" Use 'F2' to activate NerdTree
noremap <F2> :NERDTreeToggle<CR>

" Use 'F5' to reload your file and go to the bottom of screen
noremap <F5> :e<CR>G


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NEOVIM settings
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vim Note settings
let g:notes_directories = ['~/vimnotes']
let g:notes_title_sync = 'rename_file'

""""""""""""""""""""""""""""""""
" Ack/Ag settings
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

""""""""""""""""""""""""""""""""
" Paredit settings
au FileType javascript call PareditInitBuffer()
au FileType haskell call PareditInitBuffer()
au FileType python call PareditInitBuffer()
au FileType rust call PareditInitBuffer()

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
let pymode_rope = 0

" Documentation
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
let pymode_doc = 0
let pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes"
let pymode_lint = 1
let pymode_lint_checker = "pyflakes"
" Auto check on save
let g:pymode_lint_write = 1
let pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1
let pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'
let pymode_breakpoint = 1
let pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let pymode_syntax = 1
let pymode_syntax_all = 1
let pymode_syntax_indent_errors = g:pymode_syntax_all
let pymode_syntax_space_errors = g:pymode_syntax_all

" no autofold code
let g:pymode_folding = 0
let pymode_folding = 0

""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => Pylint settings
" """"""""""""""""""""""""""""""
" Load pylint code plugin
let g:pymode_lint = 1
let pymode_lint = 1

" " Switch pylint, pyflakes, pep8, mccabe code-checkers
" " Can have multiply values "pep8,pyflakes,mcccabe"
let g:pymode_lint_checker = "pyflakes, mccabe"
let pymode_lint_checker = "pyflakes, mccabe"

" " Skip errors and warnings
" " E.g. "E501,W002", "E2,W" (Skip all Warnings and Errors startswith E2) and etc
let g:pymode_lint_ignore = "E501"
let pymode_lint_ignore = "E501"

" " Select errors and warnings
" " E.g. "E4,W"
" let g:pymode_lint_select = ""

" " Check code every save
let g:pymode_lint_write = 1
let pymode_lint_write = 1

" " Auto open cwindow if errors be finded
let g:pymode_lint_cwindow = 1
let pymode_lint_cwindow = 1
"
" " Show error message if cursor placed at the error line
let g:pymode_lint_message = 1
let pymode_lint_message = 1

" " Place error signs
let g:pymode_lint_signs = 1
let pymode_lint_signs = 1

" " Setting AutoPEP8 to F7
noremap <F7> :PyLintAuto<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Run Python and Jython script
noremap <F3> :!python %<CR>
noremap <F4> :!jython %<CR>

""Run PDB on Python script
noremap <F6> :!python -i -u -m pdb %<CR>
"
""Run FSharp Interactive and Compilation
noremap <F8> :!fsi %<CR>
noremap <F9> :!fsc %<CR>

" Evaluate Clojure File
noremap <leader>e :%Eval<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode=''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ConqueTerm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("unix")
    noremap <leader>ct :ConqueTerm bash<cr>
elseif has("win32")
    noremap <leader>ct :ConqueTerm cmd.exe<cr>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive (Git)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status, Log, Branch, Add and Commit
noremap <leader>gs :Gstatus<CR>
noremap <leader>gl :Git log<CR>
noremap <leader>gb :Git branch<CR>
noremap <leader>ga :Gwrite<CR>
noremap <leader>gc :Gcommit<CR>

" Fetch, Merge, Pull and Push
noremap <leader>gfm :Git fetch origin master<cr>

noremap <leader>gmm :Git merge origin master<cr>

noremap <leader>gplm :Git pull origin master<cr>

noremap <leader>gpsm :Git push origin master<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_python_checkers = ['flake8', 'eslint']
let syntastic_python_checkers = ['flake8', 'eslint']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rainbow Parenthesis
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1
let rainbow_active = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add Current Working Directory
let g:airline_section_b = '%{getcwd()}'
let airline_section_b = '%{getcwd()}'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the Wild menu
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
syntax on


" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set guitablabel=%M\ %t
    colorscheme solarized
else
    colorscheme Monokai
endif

" Set utf8 as standard encoding and en_US as the standard language
" set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos

" Use Courier New font
set guifont=courier_new:h15:b



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

" " Copy and Paste to interact outside GVIM
vnoremap <leader>c "+y
noremap <leader>p "+gP
set clipboard=unnamed

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

if has('nvim')
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-l> <C-\><C-n><C-w>l
endif

" " Open new buffer
noremap <leader>bn :enew<cr>
" " Close the current buffer
noremap bd :bd<cr>
" " Close all the buffers
noremap ba :ba<cr>
" " Switch to next buffer
noremap bn :bn <cr>
" " Close all the buffers except current buffer
noremap bo :BufOnly! <cr>
" " List buffers
noremap <leader>l :ls <cr>

"
" " Useful mappings for managing tabs
noremap <leader>tn :tabnew<cr>
noremap to :tabonly<cr>
noremap td :tabclose<cr>

" " Opens a new tab with the current buffer's path
" " Super useful when editing files in the same directory
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

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


" BufOnly.vim  -  Delete all the buffers except the current/named buffer.
"
" Copyright November 2003 by Christian J. Robinson <infynity@onewest.net>
"
" Distributed under the terms of the Vim license.  See ":help license".
"
" Usage:
"
" :Bonly / :BOnly / :Bufonly / :BufOnly [buffer] 
"
" Without any arguments the current buffer is kept.  With an argument the
" buffer name/number supplied is kept.

command! -nargs=? -complete=buffer -bang Bonly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BOnly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang Bufonly
    \ :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BufOnly
    \ :call BufOnly('<args>', '<bang>')

function! BufOnly(buffer, bang)
	if a:buffer == ''
		" No buffer provided, use the current buffer.
		let buffer = bufnr('%')
	elseif (a:buffer + 0) > 0
		" A buffer number was provided.
		let buffer = bufnr(a:buffer + 0)
	else
		" A buffer name was provided.
		let buffer = bufnr(a:buffer)
	endif

	if buffer == -1
		echohl ErrorMsg
		echomsg "No matching buffer for" a:buffer
		echohl None
		return
	endif

	let last_buffer = bufnr('$')

	let delete_count = 0
	let n = 1
	while n <= last_buffer
		if n != buffer && buflisted(n)
			if a:bang == '' && getbufvar(n, '&modified')
				echohl ErrorMsg
				echomsg 'No write since last change for buffer'
							\ n '(add ! to override)'
				echohl None
			else
				silent exe 'bdel' . a:bang . ' ' . n
				if ! buflisted(n)
					let delete_count = delete_count+1
				endif
			endif
		endif
		let n = n+1
	endwhile

	if delete_count == 1
		echomsg delete_count "buffer deleted"
	elseif delete_count > 1
		echomsg delete_count "buffers deleted"
	endif

endfunction

" Autorelod vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
