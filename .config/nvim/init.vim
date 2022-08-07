source ~/.vimrc

""" Plugins installation
call plug#begin()

" Performance
Plug 'antoinemadec/FixCursorHold.nvim'

" Smooth scrolling
Plug 'karb94/neoscroll.nvim'

" File explorer
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Language parser thingies
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }

" Autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Using vsnip
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
" HTML autoclose tag
Plug 'alvan/vim-closetag'

" Git
Plug 'tpope/vim-fugitive'

" Fuzzy searcher
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Status line
Plug 'nvim-lualine/lualine.nvim'

" To show which lines changed (git)
Plug 'mhinz/vim-signify'

" Commenter
Plug 'preservim/nerdcommenter'

" Indentation
Plug 'Yggdroot/indentLine'

" Theme
Plug 'dracula/vim', { 'as': 'dracula' }

" Aesthetics - Others
Plug 'junegunn/rainbow_parentheses.vim'

" Python
Plug 'psf/black', { 'branch': 'stable' }

call plug#end()

""" Plugin configurations
lua << EOF
require("nvimtree-config")
require("telescope-config")
require("lualine-config")
require("treesitter-config")
require("lspconfig-config")
require("customlspsaga-config")
require("nvimcmp-config")
require("neoscroll-config")
EOF


" vim-signify
"let g:signify_sign_add = '│'
"let g:signify_sign_delete = '│'
"let g:signify_sign_change = '│'
"hi DiffDelete guifg=#ff5555 guibg=none

" FixCursorHold for better performance
let g:cursorhold_updatetime = 100

" IndentLine
let g:indentLine_char = '▏'
let g:indentLine_defaultGroup = 'NonText'
" Disable indentLine from concealing json and markdown syntax (e.g. ```)
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

""" Main configuration

filetype plugin indent on
set title
set wrap breakindent
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase

""" Filetype-Specific Configurations

" HTML, XML, Jinja
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>

" Python
augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
augroup end

""" Setup integrated terminal
" From https://betterprogramming.pub/setting-up-neovim-for-web-development-in-2020-d800de3efacd
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  set nonumber
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

""" Coloring

set termguicolors
set cursorline

" Functions and autocmds to run whenever changing colorschemes
function! TransparentBackground()
    highlight Normal guibg=NONE ctermbg=NONE
    highlight LineNr guibg=NONE ctermbg=NONE
    set fillchars+=vert:\│
    highlight WinSeparator gui=NONE guibg=NONE guifg=#444444 cterm=NONE ctermbg=NONE ctermfg=gray
    highlight VertSplit gui=NONE guibg=NONE guifg=#444444 cterm=NONE ctermbg=NONE ctermfg=gray
endfunction

" Use these colors for Pmenu, CmpPmenusBorder and TelescopeBorder when using dracula colorscheme
function! DraculaTweaks()
    " Pmenu colors when not using bordered windows
    highlight Pmenu guibg=#363948
    highlight PmenuSbar guibg=#363948
    " Completion/documentation Pmenu border color when using bordered windows
    highlight link CmpPmenuBorder NonText
    " Telescope borders
    highlight link TelescopeBorder Constant
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme dracula call DraculaTweaks()
    "autocmd ColorScheme * call TransparentBackground() " uncomment if you are using a translucent terminal and you want nvim to use that
augroup END

color dracula

""" Custom Functions

" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction


""" Custom Mappings
" NvimTree
let mapleader=","
nmap <leader>q :NvimTreeFindFileToggle<CR>
nmap \ <leader>q
nmap <leader>ee :NvimTreeFocus<CR>
nmap <leader>ee :NvimTreeFindFile<CR>
nmap <leader>er :NvimTreeRefresh<CR>
nmap <leader>ec :NvimTreeCollapse<CR>

nmap <leader>r :so $MYVIMRC<CR>
nmap <leader>t :call TrimWhitespace()<CR>
nmap <silent> <leader><leader> :noh<CR>

" LspSaga
nnoremap <silent>K :Lspsaga hover_doc<CR>
inoremap <silent> <C-k> :Lspsaga signature_help<CR>
nnoremap <silent> gh :Lspsaga lsp_finder<CR>

" Telescope fuzzy searcher
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" For cycling through buffers
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>
" For flying through buffers
nnoremap gb :ls<CR>:b<Space>

" For easier switching between windows
"nnoremap <C-H> <C-W>h
"nnoremap <C-J> <C-W>j
"nnoremap <C-K> <C-W>k
"nnoremap <C-L> <C-W>l
