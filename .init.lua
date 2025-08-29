-- =============================================================================
-- ===  General Settings
-- =============================================================================
vim.o.nocompatible = true
vim.o.history = 1000
vim.o.number = true
vim.o.relativenumber = true
vim.o.autoread = true
vim.o.inccommand = 'split'
vim.o.wildmenu = true
vim.o.ruler = true
vim.o.cmdheight = 2
vim.o.hidden = true
vim.o.backspace = 'indent,eol,start'
vim.o.whichwrap = 'b,s,<,>,[,],h,l'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.magic = true
vim.o.showmatch = true
vim.o.matchtime = 2
vim.o.noerrorbells = true
vim.o.visualbell = false
vim.o.timeout = true
vim.o.ttimeoutlen = 500
vim.o.timeoutlen = 2000
vim.o.lazyredraw = true
vim.o.laststatus = 2
vim.o.clipboard = 'unnamedplus'
vim.o.fileformats = 'unix,dos'
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.linebreak = true
vim.o.textwidth = 500
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.wrap = true
vim.o.termguicolors = true

-- =============================================================================
-- ===  Plugin Management with lazy.nvim
-- =============================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'ggandor/leap.nvim',
  'nvim-treesitter/nvim-treesitter',
  'tpope/vim-classpath',
  'tpope/vim-surround',
  'tpope/vim-vinegar',
  'flazz/vim-colorschemes',
  'vim-airline/vim-airline',
  'vim-airline/vim-airline-themes',
  'luochen1990/rainbow',
  'ervandew/supertab',
  'lotabout/skim',
  'Shougo/vimproc.vim',
  'autozimu/LanguageClient-neovim',
  'Shougo/deoplete.nvim',
  'zchee/deoplete-clang',
  'junegunn/goyo.vim',
  'junegunn/limelight.vim',
  'tpope/vim-fugitive',
  'airblade/vim-gitgutter',
  'plasticboy/vim-markdown',
  'vimwiki/vimwiki',
  'jremmen/vim-ripgrep',
  '907th/vim-auto-save',
  'sheerun/vim-polyglot',
  'mMontu/vim-RobotUtils',
  'guns/vim-clojure-highlight',
  'tpope/vim-leiningen',
  'tpope/vim-fireplace',
  'guns/vim-sexp',
  'tpope/vim-sexp-mappings-for-regular-people',
  'venantius/vim-eastwood',
  'jelera/vim-javascript-syntax',
  'moll/vim-node',
  'othree/javascript-libraries-syntax.vim',
  'ternjs/tern_for_vim',
  'eagletmt/neco-ghc',
  'enomsg/vim-haskellConcealPlus',
  'parsonsmatt/intero-neovim',
  'elmcast/elm-vim',
  'cespare/vim-toml',
  'rust-lang/rust.vim',
  'alaviss/nim.nvim',
}, {
  defaults = {
    lazy = true
  }
})

-- =============================================================================
-- ===  Key Mappings
-- =============================================================================

-- Define leader keys
vim.g.mapleader = ','
vim.g.maplocalleader = ','
vim.api.nvim_set_keymap('n', '<space>', '<nop>', { noremap = true })
vim.api.nvim_set_keymap('n', ';', ':', { noremap = true })

-- General mappings
vim.api.nvim_set_keymap('n', '<leader>pu', ':PlugUpdate<CR>:PlugUpgrade<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>sa', '1GVG', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>v', ':e $MYVIMRC<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F5>', ':e<CR>G', { noremap = true })
vim.api.nvim_set_keymap('n', 'Q', '@@', { noremap = true })

-- Writing mappings
vim.api.nvim_set_keymap('n', '<leader>l', ':Limelight!!<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>go', ':Goyo<cr>', { noremap = true })

-- Git mappings
vim.api.nvim_set_keymap('n', '<leader>gs', ':Gstatus<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gl', ':Git log<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gb', ':Git branch<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gbl', ':Gblame<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ga', ':Gwrite<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gc', ':Git commit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gfm', ':Git fetch origin master<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gmm', ':Git merge origin master<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gplm', ':Git pull origin master<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gpsm', ':Git push origin master<cr>', { noremap = true })

-- Elm mappings
vim.api.nvim_set_keymap('n', '<leader>em', ':ElmMake<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>er', ':ElmRepl<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ed', ':ElmShowDocs<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ef', ':ElmFormat<CR>', { noremap = true })

-- Buffer/Window mappings
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bd', ':bd!<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bb', ':ls<Cr>:b<Space>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bo', ':BufOnly!<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bn', ':bn<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bN', ':bN<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>bw', ':new<cr>:only<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>tn', ':tabnew<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>to', ':tabonly<cr>', { noremap = true })
api.nvim_set_keymap('n', '<leader>td', ':tabclose<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>te', ':tabedit <C-r>=expand("%:p:h")<CR>/', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>c', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>p', '"+gP', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':call RenameFile()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>hf', ':call Hindent()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader><cr>', ':noh<cr>', { silent = true, noremap = true })

-- Autocmds and functions
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  command = 'silent! lcd %:p:h',
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'vimwiki',
  command = 'set ft=markdown',
})
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '$MYVIMRC',
  command = 'source $MYVIMRC',
})
vim.api.nvim_create_autocmd('User', {
  pattern = 'GoyoEnter',
  command = 'Limelight',
})
vim.api.nvim_create_autocmd('User', {
  pattern = 'GoyoLeave',
  command = 'Limelight!',
})
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*',
  callback = function()
    if vim.fn.line("''") > 0 and vim.fn.line("''") <= vim.fn.line("$") then
      vim.cmd('normal! g`"')
    end
  end
})

-- =============================================================================
-- ===  LanguageClient-neovim Settings and Mappings
-- =============================================================================
vim.g.LanguageClient_serverCommands = {
  nim = { vim.fn.expand('~/.nimble/bin/nimlsp') },
  rust = { '/usr/local/bin/rust-analyzer' },
  python = { '/usr/local/bin/pyls' },
  cpp = { 'clangd' },
  c = { 'clangd' },
}

local function SetLSPShortcuts()
  vim.api.nvim_set_keymap('n', '<leader>ld', ':call LanguageClient#textDocument_definition()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>lr', ':call LanguageClient#textDocument_rename()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>lf', ':call LanguageClient#textDocument_formatting()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>lt', ':call LanguageClient#textDocument_typeDefinition()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>lx', ':call LanguageClient#textDocument_references()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>la', ':call LanguageClient_workspace_applyEdit()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>lc', ':call LanguageClient#textDocument_completion()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>lh', ':call LanguageClient#textDocument_hover()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>ls', ':call LanguageClient_textDocument_documentSymbol()<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>lm', ':call LanguageClient_contextMenu()<CR>', { noremap = true })
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'rust', 'python', 'nim', 'c', 'cpp' },
  command = 'lua SetLSPShortcuts()',
})

-- =============================================================================
-- ===  Haskell - intero-neovim
-- =============================================================================
local intero_maps = {
  { '<leader>is', ':InteroStart<CR>' },
  { '<leader>ik', ':InteroKill<CR>' },
  { '<leader>io', ':InteroOpen<CR>' },
  { '<leader>iov', ':InteroOpen<CR><C-W>H' },
  { '<leader>ih', ':InteroHide<CR>' },
  { '<leader>wr', ':w | :InteroReload<CR>' },
  { '<leader>il', ':InteroLoadCurrentModule<CR>' },
  { '<leader>if', ':InteroLoadCurrentFile<CR>' },
  { '<leader>t', ':InteroGenericType<CR>' },
  { '<leader>T', ':InteroType<CR>' },
  { '<leader>it', ':InteroTypeInsert<CR>' },
  { '<leader>jd', ':InteroGoToDef<CR>' },
  { '<leader>ist', ':InteroSetTargets<SPACE>' },
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'haskell',
  callback = function()
    for _, mapping in ipairs(intero_maps) do
      vim.api.nvim_set_keymap('n', mapping[1], mapping[2], { noremap = true, silent = true })
    end
    vim.api.nvim_set_keymap('n', '<leader>ist', ':InteroSetTargets<space>', { noremap = false })
  end
})

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*.hs',
  command = 'InteroReload',
})

-- =============================================================================
-- ===  Other Plugins and Settings
-- =============================================================================

-- VimWiki
vim.g.vimwiki_list = {{ path = '~/vimwiki/', syntax = 'markdown', ext = '.md' }}
vim.g.vim_markdown_folding_disabled = 1

-- AutoSave
vim.g.auto_save = 1
vim.g.auto_save_silent = 1
vim.o.updatetime = 500

-- Rainbow Parenthesis
vim.g.rainbow_active = 1

-- Vim Airline
vim.g.airline_section_b = '%{getcwd()}'
vim.g.airline_extensions_tabline_enabled = 1
vim.g.airline_extensions_tabline_left_sep = ' '
vim.g.airline_extensions_tabline_left_alt_sep = '|'

-- Colors and Fonts
vim.cmd('syntax enable')
vim.cmd('syntax on')
vim.cmd('colorscheme Tomorrow-Night')
if vim.fn.has("gui_running") == 1 or vim.fn.has("gui_vimr") == 1 then
  vim.o.guioptions = vim.o.guioptions:gsub('T', '') .. 'e'
  vim.o.guitablabel = '%M %t'
  vim.cmd('colorscheme atom')
end

-- =============================================================================
-- ===  Functions
-- =============================================================================
function _G.RenameFile()
  local old_name = vim.fn.expand('%')
  local new_name = vim.fn.input('New file name: ', old_name)
  if new_name ~= '' and new_name ~= old_name then
    vim.cmd('saveas ' .. new_name)
    vim.fn.system('rm ' .. old_name)
    vim.cmd('redraw!')
  end
end

function _G.Hindent()
  if vim.fn.executable("hindent") == 0 then
    print("Hindent not found in $PATH, did you install it? (stack install hindent)")
    return
  end
  vim.cmd('silent! silent exec "!cat % | hindent"')
  vim.cmd('redraw!')
  if vim.v.shell_error ~= 0 then
    print("Hindent: Parsing error")
  else
    vim.cmd('%!hindent')
    vim.cmd(':$')
  end
end

-- Use 'unnamedplus' for system clipboard integration
vim.opt.clipboard = 'unnamedplus'