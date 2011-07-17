""" edit

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

set pastetoggle=<F8>
set formatoptions&
set formatoptions+=mM



""" completion

set history=128

"set completeopt=menu,longest,preview
set completeopt=menu,preview,longest

" Use menu to show command-line completion (in 'full' case)
set wildmenu

" http://d.hatena.ne.jp/ns9tks/20080603/1212500562
" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,%,n~/.viminfo



""" display

set background=light

" http://omake.accense.com/wiki/vimrc
set fileencodings=utf-8,cp932,euc-jp
set ambiwidth=double
set foldmethod=marker

set nonumber
set wrap
set ruler

" Scroll when cursor gets within 3 characters of top/bottom edge
set scrolloff=3

" don't show the difference between tabs and spaces and for trailing blanks
set nolist

" Always show status line, even for one window
set laststatus=2

set cmdheight=2

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

set showmatch
set matchtime=2

set splitright

" The title of the window will be set to the value of titlestring
set title

set statusline=%F%m%r%h%w\ [%{&fileencoding}\ %{&fileformat}]\ [TYPE=%Y]\ [%l/%L,\ %c]
" set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P



""" indent

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set smartindent
set smarttab
set autoindent


""" search

set nohlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan



""" file manipulation

set autowriteall
set autoread
set nobackup
set noswapfile

" http://vimpi.net/user/dubhead
set autochdir
set backupdir=~/.Trash,.,~/
set hidden
