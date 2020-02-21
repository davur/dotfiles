set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'lifepillar/vim-solarized8'
Plugin 'dsclementsen/vim-visualstudiodark'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'junegunn/fzf'
Plugin 'zanglg/nova.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'yaml.vim'

call vundle#end()

filetype plugin indent on     " required! 

syntax enable

set background=dark
set termguicolors
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme visualstudiodark

let mapleader=" "
nmap <leader>f :FZF<cr>
nmap <leader>w :w<cr>
nmap <leader>c :%s///gn<cr>   " <leader>c to display number of search matches
nmap <leader>\ :Vexplore<cr>


set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set cursorline
set colorcolumn=80 " Mark 80th column
set wildmode=list:longest,full
set backspace=indent,eol,start
set directory=~/vimswap

" have command-line completion <tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <tab>s cycle through the possibilities:
set wildmode=list:longest,full

set nowrap          " no line wrapping;
set guioptions+=b   " add a horizontal scrollbar to the bottom

"--- search options ------------
set incsearch       " show 'best match so far' as you type
set hlsearch        " hilight the items found by the search
set ignorecase      " ignores case of letters on searches
set smartcase       " Override the 'ignorecase' option if the search pattern contains upper case characters



set enc=utf-8

"set expandtab
set tabstop=4
set listchars=tab:▶\ ,trail:·,extends:\#,nbsp:.
set list

set clipboard=unnamed


autocmd BufReadPre * if getfsize(expand("%")) > 500000 | syntax off | endif

autocmd BufRead,BufNewFile *.less set filetype=css
autocmd BufRead,BufNewFile *.scss set filetype=css
autocmd BufRead,BufNewFile *.json set filetype=javascript

if has("autocmd")
	autocmd FileType php,cpp,java,javascript	vnoremap <buffer> / :s/^/\/\/ /<cr>gv
	autocmd FileType php,cpp,java,javascript	vnoremap <buffer> ? :s/^\s*\/\/ \?//<cr>gvgv

	autocmd FileType sql			vnoremap <buffer> / :s/^/-- /<cr>gv
	autocmd FileType sql			vnoremap <buffer> ? :s/^--\s\?//<cr>gvgv

	autocmd FileType perl,bash,python vnoremap <buffer> / :s/^/# /<cr>gv
	autocmd FileType perl,bash,python vnoremap <buffer> ? :s/^\s*#\s\?//<cr>gvgv
	"autocmd FileType perl,bash,python set softtabstop=4 shiftwidth=4 expandtab
	autocmd FileType perl,bash,python syntax match Tab /\t/
	autocmd FileType perl,bash,python hi Tab gui=underline guifg=darkred ctermbg=darkred

	"autocmd FileType js,javascript,jsx set softtabstop=2 shiftwidth=2 expandtab

	autocmd FileType vim vnoremap <buffer> / :s/^/" /<cr>gv
	autocmd FileType vim vnoremap <buffer> ? :s/^\s*"\s\?//<cr>gvgv

	autocmd FileType css			vnoremap <buffer> / :s/^/\/\* /<cr>gv:s/$/ \*\//<cr>gv
	autocmd FileType css			vnoremap <buffer> ? :s/^\s*\/\*\s\?//<cr>gv:s/\s\?\*\/$//<cr>gvgv
endif

nnoremap <S-Q> @q

nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
imap jj <esc>
inoremap <C-l> <esc><C-w>l
inoremap <C-h> <esc><C-w>h
inoremap <C-j> <esc><C-w>j
inoremap <C-k> <esc><C-w>k

nnoremap <leader>j :tabnext<cr>
nnoremap <leader>k :tabprevious<cr>
nnoremap <leader>l :tabnext<cr>
nnoremap <leader>h :tabprevious<cr>


highlight nonascii guibg=Red ctermbg=1 term=standout
au BufReadPost * syntax match nonascii "[^\u0000-\u007F]"



function! SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


au QuickFixCmdPost [^l]* nested cwindow
au QuickFixCmdPost    l* nested lwindow

