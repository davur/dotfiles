" Tabs and indents
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent


" Searching
set incsearch
set ignorecase
set smartcase
set nohlsearch

" Backups and wip
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Estetics
set number
set colorcolumn=80
set signcolumn=yes

set guicursor=
set scrolloff=7
set hidden
set noerrorbells
set nowrap
set cmdheight=1
set termguicolors

set splitright


call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'gruvbox-community/gruvbox'
Plug 'git@github.com:ycm-core/YouCompleteMe.git'
Plug 'davur/vim-visualstudiodark'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set background=dark
" colorscheme visualstudiodark
colorscheme gruvbox

let mapleader = " "


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


nnoremap <silent> <leader>gd :YcmCompleter GoTo<cr>
nnoremap <silent> <leader>gr <cmd>YcmCompleter GoToReferences<cr><cmd>Telescope quickfix<cr>

inoremap <c-j> <c-n>
inoremap <c-k> <c-p>

lua <<EOF
    require('telescope').setup{ defaults = { file_ignore_patterns = {"venv"} } }
EOF


" Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo break point characters
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ? ?<c-g>u

" Moving text
inoremap <c-j> <esc>:m .+1<cr>==a
inoremap <c-k> <esc>:m .-2<cr>==a
nnoremap <c-k> :m .-2<cr>==
nnoremap <c-j> :m .+1<cr>==
vnoremap <c-j> :m '>+1<cr>gv=gv
vnoremap <c-k> :m '<-2<cr>gv=gv
