" ===============================================================================================================================================
"                                                            PLUGINS INSTALLATION
" ===============================================================================================================================================

call plug#begin('~/.dotfiles/nvim/.config/nvim/plugins')

" Themes
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'ayu-theme/ayu-vim'
Plug 'gruvbox-community/gruvbox' 
Plug 'arcticicestudio/nord-vim'
Plug 'relastle/bluewery.vim'


" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" System explorer (nerdtree)
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Icons
Plug 'ryanoasis/vim-devicons'

" coc for tslinting, auto complete and prettier
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']

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

" Visualmulti
Plug 'mg979/vim-visual-multi'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter'

"Auto renametag
Plug 'AndrewRadev/tagalong.vim'

" Line comenter
Plug 'tpope/vim-commentary'

" FZF
Plug 'junegunn/fzf'

" GO 
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" ===============================================================================================================================================
"                                                            PLUGINS CONFIGURATIONS
" ===============================================================================================================================================

" ===============================================================THEME===========================================================================

let g:gruvbox_contrast_dark = 'hard'
colorscheme nord
" let g:lightline = { 'colorscheme': 'bluewery' }

" ===============================================================NERDTREE========================================================================

map <F2> :call NERDTreeToggleAndRefresh()<CR>

function NERDTreeToggleAndRefresh()
  :NERDTreeToggle
  if g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  endif
endfunction

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" ===============================================================DEVICONS========================================================================

set encoding=UTF-8

" ===============================================================AIRLINE=========================================================================

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'


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

" ===============================================================TAGALONG========================================================================

let g:tagalong_filetypes = ['html', 'xml', 'jsx', 'eruby', 'ejs', 'eco', 'php', 'htmldjango', 'javascriptreact', 'typescriptreact']

" ===============================================================TREESITTER======================================================================

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true} }
" ===============================================================GENERAL CONFIGURATIONS==========================================================
syntax enable
syntax on
set mouse=a
set number
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set noexpandtab
set smartindent
set incsearch
set smartcase
set noswapfile
set nobackup
set colorcolumn=150
set spelllang=en,es
set ignorecase
set termguicolors
set scrolloff=8
set copyindent
set preserveindent
set signcolumn=yes
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
let mapleader = "-"
" ===============================================================KEYMAPS=======================================================================
vnoremap <C-c> "*y
map <C-p> "*p
inoremap <silent><expr> <c-space> coc#refresh()

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j <esc>:m .+1<CR>==
nnoremap <leader>k <esc>:m .-2<CR>==
