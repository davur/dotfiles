set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'lifepillar/vim-solarized8'
Plugin 'dsclementsen/vim-visualstudiodark'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'junegunn/fzf'
Plugin 'zanglg/nova.vim'

call vundle#end()

filetype plugin indent on     " required! 

syntax enable

set background=dark
set termguicolors
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme nova

let mapleader=" "
nmap <leader>f :FZF<cr>
nmap <leader>w :w<cr>



set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set cursorline
set colorcolumn=80 " Mark 80th column
set wildmode=list:longest,full
set backspace=indent,eol,start

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

autocmd BufRead,BufNewFile *.less set filetype=css
autocmd BufRead,BufNewFile *.scss set filetype=css

if has("autocmd")
 	autocmd FileType php,cpp,java,javascript	vnoremap <buffer> / :s/^/\/\/ /<cr>gv
 	autocmd FileType php,cpp,java,javascript	vnoremap <buffer> ? :s/^\s*\/\/ \?//<cr>gvgv

 	autocmd FileType sql			vnoremap <buffer> / :s/^/-- /<cr>gv
 	autocmd FileType sql			vnoremap <buffer> ? :s/^--\s\?//<cr>gvgv

 	autocmd FileType perl,bash,python vnoremap <buffer> / :s/^/# /<cr>gv
 	autocmd FileType perl,bash,python vnoremap <buffer> ? :s/^\s*#\s\?//<cr>gvgv
 	autocmd FileType perl,bash,python set softtabstop=4 shiftwidth=4 expandtab
 	autocmd FileType perl,bash,python syntax match Tab /\t/
 	autocmd FileType perl,bash,python hi Tab gui=underline guifg=darkred ctermbg=darkred

	autocmd FileType js,javascript,jsx set softtabstop=4 shiftwidth=4 expandtab

 	autocmd FileType vim vnoremap <buffer> / :s/^/" /<cr>gv
 	autocmd FileType vim vnoremap <buffer> ? :s/^\s*"\s\?//<cr>gvgv

 	autocmd FileType css			vnoremap <buffer> / :s/^/\/\* /<cr>gv:s/$/ \*\//<cr>gv
 	autocmd FileType css			vnoremap <buffer> ? :s/^\s*\/\*\s\?//<cr>gv:s/\s\?\*\/$//<cr>gvgv
endif

nnoremap <S-Q> @q

"imap <C-j> <Esc><S-V>dp<S-V>
" map <C-k> <Esc><S-V>dkkp<S-V>
" map <C-j> <Esc><S-V>dp<S-V>
"imap <C-k> <Esc><S-V>dkkp<S-V>
map <S-Esc> :set hls!<CR>:set hls?<CR>
" nmap <Tab> >>
" nmap <S-Tab> <<
" vmap <Tab> >gv
" vmap <S-Tab> <gv


"Open tag definition in new tab
set splitright
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"Open file in new tab
"nnoremap gf :tab split<CR>gf
nnoremap gF <C-W>gf
nnoremap <leader>sf :vsplit<CR>gf

vmap praise :<C-U>!svn praise <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
" imap <Esc> <Esc>l
vmap < <gv
vmap > >gv
" imap <Esc> <Esc>l
".bash_login
" autocmd! bufwritepost * :!java -classpath ~ SaveLog ~/Notes/SaveLog-2013-11.txt '%:p'
"

    map     <C-S-F> <ESC>:cw<CR><C-w>k:Ack --html --python --php --js ""<LEFT>
    map     <C-S-N> <ESC>:cn<CR>
    map     <C-S-P> <ESC>:cp<CR>


highlight nonascii guibg=Red ctermbg=1 term=standout
au BufReadPost * syntax match nonascii "[^\u0000-\u007F]"



function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
