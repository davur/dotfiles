set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'editorconfig/editorconfig-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

filetype plugin indent on     " required!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=1000

" Ignore some file
set wildignore=*.swp,*.bak,*.pyc,*.class,.git,*.o,*.obj

" Set to auto read when a file is changed from the outside
set autowrite

" With a map leader it's possible to do extra key combinations
" leader is press comma (,) key
" like <leader>w saves the current file
" let mapleader=" "
" let g:mapleader=" "
map <Space> <Leader>

" Fast saving with leader + w
nmap <leader>w :w<cr>

" Fast editing of the .vimrc
" map <leader>e :e! ~/.vimrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set softtabstop=4
set shiftwidth=4
" set smarttab
" set expandtab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indet


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set so=7            " Set 7 lines to the curors - when moving vertical..
set ruler           "Always show current position
set hid             "Change buffer - without saving
set nohidden

" Set backspace config
set backspace=eol,start,indent
"--- Keystrokes ----------------
" h and l wrap between lines, cursor keys wrap in insertion mode
set whichwrap=h,l,~,[,]
set whichwrap+=<,>,h,l

set nolazyredraw "Don't redraw while executing macros
set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them

" No sound on errors
set noerrorbells
set novisualbell
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl
syntax on
au BufReadPost * if getfsize(bufname("%")) > 512*1024 |
\ set syntax= |
\ endif


set shell=/bin/bash

set guioptions-=T
set background=dark
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
colorscheme torte
set gfn=Liberation\ Mono\ 10

set encoding=utf8
try
    lang en_US
catch
endtry

" if has("gui_running")
"   " GUI is running or is about to start.
"   " Maximize gvim window.
"   set lines=43
"   set co=87
" endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Turn backup off, since most stuff is in SVN, git anyway...
" set nobackup
" set nowb
" set noswapfile

set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Useful when moving accross long lines
map j gj
map k gk

map <silent> <leader><ESC> :nohlsearch<cr>

" GRB: clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<CR>/<BS>


" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Moving tab using CTRL+ the arrows
map <C-right> :bn<CR>
map <C-left> :bp<CR>

" Tab configuration
map <C-Tab> :tabnext<cr>
map <C-S-Tab> :tabprev<cr>
map <leader>tn :tabnew! %<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" When pressing <leader>cd switch to the directory of the open buffer
" map <leader>cd :cd %:p:h<cr>
set noautochdir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" My CUSTOM
"
" set cmdheight=1    cd %:p:h           " Explicitly set the height of the command line
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set pastetoggle=<F3>          " Press F3 for toggle paste mode
set cursorline
set colorcolumn=80 " Mark 80th column

" Taken From http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
" autocmd FileType python highlight OverLength ctermbg=red ctermfg=white guibg=#FFD9D9
" autocmd FileType python match OverLength /\%81v.\+/

" Set default environment based on current edited files
" autocmd BufEnter * silent! lcd %:p:h

" Use System clipboard for yank/put copy/paste etc
set clipboard=unnamed
" <leader>p to paste from yank register
noremap <leader>p "0p
nnoremap <leader>p "0gp

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

" Search and error color highlights
hi Search guifg=#ffffff guibg=#0000ff gui=none ctermfg=white ctermbg=darkblue
hi IncSearch guifg=#ffffff guibg=#8888ff gui=none ctermfg=white
highlight SpellBad guifg=#ffffff guibg=#8888ff gui=none ctermfg=black ctermbg=darkred

" Use UTF-8 as the default buffer encoding
set enc=utf-8

" Always show status line, even for one window
set laststatus=2

" Scroll when cursor gets within 3 characters of top/bottom edge
set scrolloff=3

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" Don't request terminal version string (for xterm)
set t_RV=


" page down with <SPACE>, pageup with - or <BkSpc>
" noremap <Space> <PageDown>
" noremap <BS> <PageUp>

" Execute Python file being edited with <Shift> + e:
nnoremap E w:<CR>:!python % <CR>

" Shortcut to Close quickfix window with leader+c
nnoremap <leader>c <CR>:cclose<CR>

" Set autocomplete form
set completeopt=menuone,longest,preview

"--- python formatting help ---
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Enable omni completion.
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,ctp set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php,ctp set omnifunc=phpcomplete#CompletePHP
autocmd FileType vim set omnifunc=syntaxcomplete#Complete

" markdown
au BufEnter,Bufread *.mkd,*.md,*.mdown,*.markdown set tw=0

" http://www.brankovukelic.com/post/2091037293/turn-vim-into-powerful-javascript-editor"

" " " " " Folding
" " " " " auto save folding : http://princ3.wordpress.com/2007/01/26/automaticaly-save-foldings-in-vim/
" " " " set viewoptions=folds
" " " " au BufWinLeave * silent! mkview
" " " " au BufWinEnter * silent! loadview

autocmd Syntax c,cpp,vim,xml,html,xhtml,js,php,py,python set foldmethod=manual
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR

" Useful but only if you are willing to claim ownership of code you did not
" write in source controlled environments
" "remove trailing whitespace
" "http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
" autocmd BufWritePre *.c :%s/\s\+$//e
" autocmd BufWritePre *.cpp :%s/\s\+$//e
" autocmd BufWritePre *.c++ :%s/\s\+$//e
" autocmd BufWritePre *.h :%s/\s\+$//e
" autocmd BufWritePre *.java :%s/\s\+$//e
" autocmd BufWritePre *.php :%s/\s\+$//e
" autocmd BufWritePre *.pl :%s/\s\+$//e
" autocmd BufWritePre *.py :%s/\s\+$//e

" tabs, not spaces for php, ctp
au BufEnter,BufRead *.php,*.ctp set noexpandtab

" Autoclose quickfix windows when quit
" http://stackoverflow.com/questions/7476126/how-to-automatically-close-the-quick-fix-window-when-leaving-a-file
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" http://stackoverflow.com/questions/1687252/with-vim-use-both-snipmate-and-pydiction-together-share-the-tab-key "
" Change share keys between pydiction and snipmate
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
if has("gui_running")
    " Vimdiff colorscheme
    highlight DiffAdd cterm=none ctermfg=bg ctermbg=Green gui=none guifg=bg guibg=Green
    highlight DiffDelete cterm=none ctermfg=bg ctermbg=Red gui=none guifg=bg guibg=Red
    highlight DiffChange cterm=none ctermfg=bg ctermbg=Yellow gui=none guifg=bg guibg=Yellow
    highlight DiffText cterm=none ctermfg=bg ctermbg=Magenta gui=none guifg=bg guibg=Magenta
endif

""""""""""""""""""""""""""""""""""""""""""""""""
" Auto close preview menu autocomplete after choose
" http://stackoverflow.com/questions/3105307/how-do-you-automatically-remove-the-preview-window-after-autocompletion-in-vim
"
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" CUSTOM CONFIGURATION FOR INSTALLED PLUGIN
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pep8 using F6
" You can change with this :
let g:pep8_map='<F6>'

" Pydiction
let g:pydiction_location='/home/ubuntu/.vim/bundle/Pydiction/complete-dict'

"""" PYTHON STYLE """"
let python_highlight_all=1 " Enable all plugin's highlighting.
let python_slow_sync=1 " For fast machines.
let python_print_as_function=1 " Color 'print' function.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FuzzFinder Shorcuts. Using F2 for opening FuzzyFinderTextMate
map <leader>f :FufFileWithCurrentBufferDir<CR>
map <leader>m :FufFileWithFullCwd<CR>
map <leader>b :FufBuffer<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MRU shorcuts
map <leader><space> :MRU<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pyflakes configuration
if has("gui_running")
    highlight SpellBad term=underline gui=undercurl guisp=Orange
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configure neocomplcache autocomplete
" http://www.vim.org/scripts/script.php?script_id=2620

highlight Pmenu gui=bold

if has("gui_running")
    highlight SpellBad term=underline gui=undercurl guisp=Orange
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open Window Explorer NerdTree & Tagbar using (left-right sidebar) using <F8>
"
function! ToggleNERDTreeAndTagbar()
    let w:jumpbacktohere = 1

" Detect which plugins are open
    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif
    let tagbar_open = bufwinnr('__Tagbar__') != -1

" Perform the appropriate action
    if nerdtree_open && tagbar_open
        NERDTreeClose
        TagbarClose
    elseif nerdtree_open
        TagbarOpen
    elseif tagbar_open
        NERDTreeTabsToggle
    else
        NERDTreeTabsToggle
        TagbarOpen
    endif

" Jump back to the original window
    for window in range(1, winnr('$'))
        execute window . 'wincmd w'
        if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
            break
        endif
    endfor
endfunction

" now you can open NERDTree and Tagbar using F8
" http://stackoverflow.com/questions/6624043/how-to-open-or-close-nerdtree-and-tagbar-with-leader
nmap <F8> :call ToggleNERDTreeAndTagbar()<CR>

" TagBar Configuration
let g:tagbar_usearrows=1
let g:tagbar_width=30
let g:tagbar_singleclick=1

" Use leader + l to open Tagbar in Right side
nnoremap <leader>l :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""
" NERDTree : https://github.com/scrooloose/nerdtree.git
" MODIFYING NERDTree MY CUSTOM
" how to using NERDTree :
" http://ykyuen.wordpress.com/2011/04/04/nerdtree-the-file-explorer-in-vivim/
"""""""""""""""""""""""""""""""""""""""""""

" Enable this for make NERDTree load every opening files
" autocmd VimEnter * NERDTree " Make Always Load NERDTree every opening files
" autocmd VimEnter * wincmd p " Automatically go to buffer every time open files

" FIXING NERDTree, automatically close if there no file edited
"https://github.com/scrooloose/nerdtree/issues/21
"
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Use leader + . for opening File Explorer
map <leader>e :NERDTreeTabsToggle<CR>
let g:NERDTreeShowBookmarks=1
let g:NERDTreeMouseMode=3
let g:NERDTreeWinSize=30

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" Taken from http://dotfiles.org/~joaoTrindade/.vimrc
" Plugin related {{{1
"#########################################

" Minibuffer{{{
""""""""""""""""""""""""""""""
"Show the miniBufExplorer from the start
" let g:miniBufExplorerMoreThanOne = 0

"Not using because I don't use the vertival window
"Use a vertical windows
"let g:miniBufExplVSplit = 5

"Put the miniBufExplorer windows at the right
"let g:miniBufExplSplitBelow=1

"Maximum size of the mini buffer explorer window
"let g:miniBufExplMaxSize = 15

"Still haven't discovered what it does
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplMapWindowNavVim = 1
"
" make tabs show complete (no broken on two lines)
let g:miniBufExplTabWrap = 1

" If you use other explorers like TagList you can (As of 6.2.8) set it at 1:
let g:miniBufExplModSelTarget = 1

" If you would like to single click on tabs rather than double clicking on them to goto the selected buffer.
let g:miniBufExplUseSingleClick = 1

"for buffers that have NOT CHANGED and are NOT VISIBLE.
highlight MBENormal guifg=LightBlue

" for buffers that HAVE CHANGED and are NOT VISIBLE
highlight MBEChanged guifg=Red

" buffers that have NOT CHANGED and are VISIBLE
highlight MBEVisibleNormal term=bold cterm=bold gui=bold guifg=Green

" buffers that have CHANGED and are VISIBLE
highlight MBEVisibleChanged term=bold cterm=bold gui=bold guifg=Green

let g:bufExplorerSortBy = "name"

autocmd BufRead,BufNew :call UMiniBufExplorer

"""""""""""""""""""""""""""""""""""
" Stolen from http://dev.gentoo.org/~bass/configs/vimrc.html
"
" Adapt the status line accourding to the window
"""""""""""""""""""""""""""""""""""
if has("autocmd")
    au FileType qf
                \ if &buftype == "quickfix" |
                \     setlocal statusline=%2*%-3.3n%0* |
                \     setlocal statusline+=\ \[Compiler\ Messages\] |
                \     setlocal statusline+=%=%2*\ %<%P |
                \ endif

    fun! FixMiniBufExplorerTitle()
        if "-MiniBufExplorer-" == bufname("%")
            setlocal statusline=%2*%-3.3n%0*
            setlocal statusline+=\[Buffers\]
            setlocal statusline+=%=%2*\ %<%P
        endif
    endfun

    au BufWinEnter *
                \ let oldwinnr=winnr() |
                \ windo call FixMiniBufExplorerTitle() |
                \ exec oldwinnr . " wincmd w"
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}


let NERDTreeIgnore = ['\.pyc$']



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


 	autocmd FileType vim vnoremap <buffer> / :s/^/" /<cr>gv
 	autocmd FileType vim vnoremap <buffer> ? :s/^\s*"\s\?//<cr>gvgv

 	autocmd FileType css			vnoremap <buffer> / :s/^/\/\* /<cr>gv:s/$/ \*\//<cr>gv
 	autocmd FileType css			vnoremap <buffer> ? :s/^\s*\/\*\s\?//<cr>gv:s/\s\?\*\/$//<cr>gvgv

	autocmd FileType yaml set tabstop=4 softtabstop=4 shiftwidth=4
endif

abbreviate <?php= <?php echo
abbreviate <? <?php


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




cmap w!! %!sudo tee > /dev/null %

imap jj <Esc>j

" page up/down
map <C-j> ztL
map <C-k> z-H
" tab left/right
map <C-h> gT
map <C-l> gt

" move current line up/down
map <C-S-j> ddp
map <C-S-k> ddkP

" Bundle 'vim-scripts/pep8'

let g:syntastic_python_checker_args = "--max-line-length=100"
let g:nerdtree_tabs_startup_cd = 0

let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
let g:pydiction_menu_height = 30

