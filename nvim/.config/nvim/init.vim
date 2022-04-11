"	===============================================================================================================================================
"                                                            PLUGINS INSTALLATION
" ===============================================================================================================================================

call plug#begin('~/.dotfiles/nvim/.config/nvim/plugins')

" Themes
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'ayu-theme/ayu-vim'
Plug 'haishanh/night-owl.vim'
Plug 'gruvbox-community/gruvbox' 
Plug 'arcticicestudio/nord-vim'
Plug 'relastle/bluewery.vim'
Plug 'bluz71/vim-moonfly-colors'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'olimorris/onedarkpro.nvim'

" Devicons
Plug 'ryanoasis/vim-devicons'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" coc for prettier
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" coc extensions
let g:coc_global_extensions = ['coc-prettier','coc-explorer']

" Jsx highlight
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" by default, if you open tsx file, neovim does not show syntax colors
" typescript-vim will do all the coloring for typescript keywords
Plug 'leafgarland/typescript-vim'

" Git integration plugin
Plug 'tpope/vim-fugitive'

" File searcher
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ThePrimeagen/harpoon'


" Visualmulti
Plug 'mg979/vim-visual-multi'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter'

"Auto renametag
Plug 'AndrewRadev/tagalong.vim'

" Line comenter
Plug 'tpope/vim-commentary'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-lua/lsp_extensions.nvim'

" GO 
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()


" ===============================================================================================================================================
"                                                            PLUGINS CONFIGURATIONS
" ===============================================================================================================================================

" ===============================================================THEME===========================================================================

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
let g:gruvbox_termcolors=16


" ===============================================================EXPLORER========================================================================

 map <space>e :CocCommand explorer<CR>

"	===============================================================DEVICONS========================================================================

set encoding=UTF-8

" ===============================================================AIRLINE=========================================================================

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='gruvbox'


" ===============================================================REACT CONFIGURATIONS============================================================

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
au BufNewFile,BufRead *.js setlocal filetype=javascript
au BufNewFile,BufRead *.jsx setlocal filetype=javascript.jsx
let g:vim_jsx_pretty_colorful_config = 1 

" ===============================================================GO CONFIGURATIONS===============================================================

let g:go_fmt_command = "goimports"

" ===============================================================PRETTIER========================================================================

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" ===============================================================TELESCOPE=======================================================================

nnoremap ff :lua require('telescope.builtin').find_files()<CR>
nnoremap fb :lua require('telescope.builtin').buffers()<CR>
nnoremap fg :lua require('telescope.builtin').live_grep()<CR>
command! -nargs=0 Fh :Telescope help_tags
command! -nargs=0 FB :Telescope file_browser

" ===============================================================HARPOON=========================================================================

nnoremap <space>h :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <space>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <M-h> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <M-j> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <M-k> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <M-l> :lua require("harpoon.ui").nav_file(4)<CR>

" ===============================================================TAGALONG========================================================================

let g:tagalong_filetypes = ['html', 'xml', 'jsx', 'eruby', 'ejs', 'eco', 'php', 'htmldjango', 'javascriptreact', 'typescriptreact']

" ===============================================================GENERAL CONFIGURATIONS==========================================================
syntax enable
set mouse=a
set number
set relativenumber
highlight LineNr guifg=#67a3bb
set nohlsearch
set hidden
set noerrorbells
set copyindent
set preserveindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set incsearch
set smartcase
set noswapfile
set nobackup
set colorcolumn=120
set spelllang=en,es
set ignorecase
set termguicolors
set scrolloff=8
set copyindent
set preserveindent
set noshowmode
set clipboard=unnamedplus
hi! Normal ctermbg=NONE guibg=NONE
" hi! NonText ctermbg=NONE guibg=NONE
let mapleader = " "
set signcolumn=no
" ===============================================================KEYMAPS=======================================================================

lua require("cabanesdev.init")

" move lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j <esc>:m .+1<CR>==
nnoremap <leader>k <esc>:m .-2<CR>==

"change size
nnoremap <leader>+ :vertical resize +5<cr>
nnoremap <leader>- :vertical resize -5<cr>

" Fugitive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>
