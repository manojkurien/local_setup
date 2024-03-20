" enables syntax highlighting
syntax on

" Better colors
set termguicolors

" number of spaces in a <Tab>
set tabstop=4
set softtabstop=4
set expandtab

" enable autoindents
set smartindent

" number of spaces used for autoindents
set shiftwidth=4

" adds line numbers
set number
set relativenumber
" columns used for the line number
set numberwidth=4

" highlights the matched text pattern when searching
set incsearch
set nohlsearch

" open splits intuitively
set splitbelow
set splitright

" navigate buffers without losing unsaved work
set hidden

" start scrolling when 8 lines from top or bottom
set scrolloff=8

" Save undo history
set undofile

" Enable mouse support
set mouse=a

" case insensitive search unless capital letters are used
set ignorecase
set smartcase

" ...general settings
set noshowmode

" display status line
set laststatus=2

" Add full file path to your existing statusline
set statusline+=%F

" remaps
let mapleader = ' '

nnoremap <leader>fff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>gb :GBrowse! "$(git_main_branch)"\:%<cr>

call plug#begin('~/.config/nvim/plugged')

Plug 'gruvbox-community/gruvbox'

" Telescope requires plenary to function
Plug 'nvim-lua/plenary.nvim'
" The main Telescope plugin
Plug 'nvim-telescope/telescope.nvim'
" An optional plugin recommended by Telescope docs
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" LSP
Plug 'neovim/nvim-lspconfig'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

Plug 'itchyny/lightline.vim'
Plug 'williamboman/mason.nvim'
call plug#end()


" declare your color scheme
colorscheme gruvbox
" Use this for dark color schemes
set background=dark

lua require('manojkurien')
