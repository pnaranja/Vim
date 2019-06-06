set nocompatible

call plug#begin('~/.local/share/nvim/plugged')
Plug 'w0rp/ale'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'flazz/vim-colorschemes'
Plug 'luochen1990/rainbow'
Plug 'bling/vim-airline'
Plug 'ervandew/supertab'
Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

if has('nvim')
    function! DoRemote(arg)
      UpdateRemotePlugins
    endfunction
    Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
else
    Plug 'Shougo/neocomplete'
endif



" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'vimwiki/vimwiki'

" Searching
Plug 'jremmen/vim-ripgrep'

" AutoSave
Plug '907th/vim-auto-save'


" For particular programming languages
Plug 'sheerun/vim-polyglot'

Plug 'python-mode/python-mode' , { 'for' : 'python' }
Plug 'davidhalter/jedi-vim', { 'for' : 'python' }

Plug 'guns/vim-clojure-highlight' , { 'for' : 'clojure' }
Plug 'tpope/vim-leiningen' , { 'for' : 'clojure' }
Plug 'tpope/vim-fireplace' , { 'for' : 'clojure' }
Plug 'guns/vim-sexp', { 'for' : 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people' , { 'for' : 'clojure' }
Plug 'venantius/vim-eastwood',  { 'for' : 'clojure' }

Plug 'jelera/vim-javascript-syntax' ,{ 'for' : 'javascript' } 
Plug 'moll/vim-node' , { 'for' : 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim' , { 'for' : 'javascript' }
Plug 'ternjs/tern_for_vim' , { 'for' : 'javascript' }

Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }
Plug 'parsonsmatt/intero-neovim', { 'for': 'haskell' }

Plug 'elmcast/elm-vim', {'for' : 'elm'}

Plug 'cespare/vim-toml', {'for' : 'toml'}

Plug 'rust-lang/rust.vim', {'for' : 'rust'}
Plug 'racer-rust/vim-racer', {'for' : 'rust'}
Plug 'sebastianmarkow/deoplete-rust', {'for' : 'rust'}

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
set history=1000

" Enable line numbers
set nu

" Enable relative line numbers
set rnu

" Enable filetype plugins
filetype plugin on
filetype indent on

" Recognize jython files as python
au BufNewFile,BufRead *.jy set filetype=python

" Recognize Markdown and disable folding
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:vim_markdown_folding_disabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimWiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" Set to auto read when a file is changed from the outside
set autoread

" Set current working directory as the file that is open
autocmd BufEnter * silent! lcd %:p:h

" Set VimDiaryNote shortcuts
:nmap <Leader>dy <Plug>VimwikiMakeYesterdayDiaryNote
:nmap <Leader>dn <Plug>VimwikiMakeDiaryNote
:nmap <Leader>di <Plug>VimwikiDiaryIndex
:nmap <Leader>dgl <Plug>VimwikiDiaryGenerateLinks
:nmap <Leader>ti <Plug>VimwikiToggleListItem

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Select all
noremap <leader>sa 1GVG

" Quick open of the vimrc file
noremap <leader>v :e $MYVIMRC<CR>

" Use 'F5' to reload your file and go to the bottom of screen
" Useful for checking logs
noremap <F5> :e<CR>G


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General neovim settings
if has('nvim')
    set inccommand=split
endif


""""""""""""""""""""""""""""""""
" SuperTab

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running") || has("gui_vimr")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif
""""""""""""""""""""""""""""""""
" LSP - LanguageClient_serverCommands

let g:LanguageClient_serverCommands = { 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'] }

function SetLSPShortcuts()
  nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
  nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
  nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
  nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
  nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
endfunction()

augroup LSP
  autocmd!
  autocmd FileType rust call SetLSPShortcuts()
augroup END


""""""""""""""""""""""""""""""""
" AutoCompletion

if has('nvim')
    " deoplete
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_ignore_case = 1  "let matcher ignore case
    let g:deoplete#enable_smart_case = 1   "smart case
    let g:deoplete#omni#input_patterns = {}
else
    " neocomplete
    let g:neocomplete#enable_at_startup = 1
endif

""""""""""""""""""""""""""""""""
" AutoSave
let g:auto_save = 1
let g:auto_save_silent = 1
let updatetime=500

""""""""""""""""""""""""""""""""

" Configure necoghc to be the default tab completion
let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

""""""""""""""""""""""""""""""""
" Haskell - intero-neovim
augroup interoMaps
  au!
  " Maps for intero. Restrict to Haskell buffers so the bindings don't collide.

  " Background process and window management
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  " Open intero/GHCi split horizontally
  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
  " Open intero/GHCi split vertically
  au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
  au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>

  " Reloading (pick one)
  " Automatically reload on save
  au BufWritePost *.hs InteroReload
  " Manually save and reload
  au FileType haskell nnoremap <silent> <leader>wr :w \| :InteroReload<CR>

  " Load individual modules
  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

  " Type-related information
  au FileType haskell nnoremap <silent> <leader>t :InteroGenericType<CR>
  au FileType haskell nnoremap <silent> <leader>T :InteroType<CR>
  au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

  " Navigation
  au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>

  " Managing targets
  " Prompts you to enter targets (no silent):
  au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
augroup END

""""""""""""""""""""""""""""""""
" Rust
set hidden
let g:racer_cmd = "~/.cargo/bin/racer"
let g:rustfmt_command = "rustfmt +nightly"
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

let g:rust_clip_command = 'xclip -selection clipboard'
let g:racer_experimental_completer = 1

" https://github.com/sebastianmarkow/deoplete-rust/issues/13
if executable('racer')
  let g:deoplete#sources#rust#racer_binary = systemlist('which racer')[0]
endif

if executable('rustc')
    " if src installed via rustup, we can get it by running 
    " rustc --print sysroot then appending the rest of the path
    let rustc_root = systemlist('rustc --print sysroot')[0]
    let rustc_src_dir = rustc_root . '/lib/rustlib/src/rust/src'
    if isdirectory(rustc_src_dir)
        let g:deoplete#sources#rust#rust_source_path = rustc_src_dir
    endif
endif

""""""""""""""""""""""""""""""""
" Elm format and commands
let g:elm_format_autosave = 0
let g:elm_setup_keybindings = 0
noremap <leader>em :ElmMake<CR>
noremap <leader>er :ElmRepl<CR>
noremap <leader>ed :ElmShowDocs<CR>
noremap <leader>ef :ElmFormat<CR>

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

"Ale Linting
let g:ale_lint_on_text_changed = "normal"
let g:ale_lint_delay = 3000
let b:ale_linters = {'rust': ['rustup', 'run', 'nightly', 'rls']}

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
"
" enable python 3 syntax checking
let g:pymode_python = 'python3'
let pymode_python = 'python3'

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
au FileType python noremap <F7> :PyLintAuto<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Run Python and Jython script
au FileType python noremap <F3> :!python3 %<CR>

""Run PDB on Python script
au FileType python noremap <F6> :!python3 -i -u -m pdb %<CR>

" Evaluate Clojure File
au FileType clojure noremap <leader>e :%Eval<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive (Git)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status, Log, Branch, Add and Commit
noremap <leader>gs :Gstatus<CR>
noremap <leader>gl :Git log<CR>
noremap <leader>gb :Git branch<CR>
noremap <leader>gbl :Gblame<CR>
noremap <leader>ga :Gwrite<CR>
noremap <leader>gc :Gcommit<CR>

" Fetch, Merge, Pull and Push
noremap <leader>gfm :Git fetch origin master<cr>
noremap <leader>gmm :Git merge origin master<cr>
noremap <leader>gplm :Git pull origin master<cr>
noremap <leader>gpsm :Git push origin master<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Rainbow Parenthesis
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add Current Working Directory
let g:airline_section_b = '%{getcwd()}'

let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

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

" Set Leader timeout
set tm=2000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Macros
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't redraw while executing macros (good performance config)
set lazyredraw

" Repeat last macro
nnoremap Q @@


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
syntax on

" Set utf8 as standard encoding and en_US as the standard language
" set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos

colorscheme Tomorrow-Night

" Set extra options when running in GUI mode
if has("gui_running") || has("gui_vimr")
    set guioptions-=T
    set guioptions+=e
    set guitablabel=%M\ %t
    colorscheme atom
endif

set termguicolors


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
    " Use <Esc> to escape terminal insert mode
    tnoremap <Esc> <C-\><C-n>

    noremap <BS> <C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-l> <C-\><C-n><C-w>l
endif

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

" From https://www.briefs.fm/vim-tips-from-joey/4 
" Thanks to Gary Bernhardt
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'))
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>r :call RenameFile()<cr>

" From https://github.com/alx741/vim-hindent
" Requires hindent version 5+
function! Hindent()
    if !executable("hindent")
        echom "Hindent not found in $PATH, did you installed it? (stack install hindent)"
        return
    endif

    silent! silent exec "!cat % | hindent"
    exec ':redraw!'

    if v:shell_error
        echom "Hindent: Parsing error"
    else
        silent! exec "%!hindent"
        exec ':$'
    endif
endfunction
map <leader>hf :call Hindent()<cr>
