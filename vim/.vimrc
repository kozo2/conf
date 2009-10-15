" {{{ fundamentals

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Enable loading filetype and indentation plugins
filetype plugin indent on

" Turn syntax highlighting on
syntax on

" }}}



" {{{ set for edit

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

" Use F8 to toggle 'paste' mode
set pastetoggle=<F8>

" :h fo-table
set formatoptions+=mM

" }}}



" {{{ set for completion

" Remember up to 100 'colon' commmands and search patterns
set history=100

" Insert mode completion options
set completeopt=menu,longest,preview

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

" }}}



" {{{ set for display

" Use UTF-8 as the default buffer encoding
set enc=utf-8

" http://omake.accense.com/wiki/vimrc
set fileencodings=utf-8,cp932,euc-jp
set ambiwidth=double
set foldmethod=marker

" don't print the line number in front of each line
set nonumber

" Show line, column number, and relative position within a file in the status line
set ruler

" Scroll when cursor gets within 3 characters of top/bottom edge
set scrolloff=3

" don't show the difference between tabs and spaces and for trailing blanks
set nolist

" lines longer than the width of the window will wrap
set wrap

" Don't wrap words by default
set textwidth=0

" Always show status line, even for one window
set laststatus=2

" Number of screen lines to use for the command-line
set cmdheight=2

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" When a bracket is inserted, briefly jump to a matching one
set showmatch

" Jump to matching bracket for 2/10th of a second (works with showmatch)
set matchtime=2

" Splitting a window will put the new window below the current one
"set splitbelow

" Splitting a window will put the new window right of the current one
"set splitright

" The title of the window will be set to the value of titlestring
set title

set statusline=%F%m%r%h%w\ [%{&fileencoding}\ %{&fileformat}]\ [TYPE=%Y]\ [%l/%L,\ %c]
" set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" Highlight the screen line of the cursor with CursorLine
setlocal cursorline

" }}}



" {{{ set for indent

" http://d.hatena.ne.jp/amachang/20081019/1224365794
" Use 4 spaces for (auto)indent
set shiftwidth=4

" Use 4 spaces for <Tab> and :retab
set tabstop=4

" When softtabstop is zero, this feature is off
set softtabstop=0

" Do smart autoindenting when starting a new line
set smartindent

" In Insert mode: Use the appropriate number of spaces to insert a <Tab>
set expandtab

" When on, a <Tab> in front of a line inserts blanks according to shiftwidth
set smarttab

" Copy indent from current line when starting a new line
set autoindent

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" }}}



" {{{ set for search

" Don't highlight results of a search
set nohlsearch

" Enable incremental search
set incsearch

" The case of normal letters is ignored
set ignorecase

" Override the 'ignorecase' option if the search pattern contains upper case
" characters
set smartcase

" Searches wrap around the end of the file
set wrapscan

" }}}



" {{{ set for file manipulation

" Write contents of the file, if it has been modified, on buffer exit
set autowrite

" Write swap file to disk after every 50 characters
set updatecount=50
set updatetime=500

" When a file has been detected to have been changed outside of Vim and
" it has not been changed inside of Vim, automatically read it again.
set autoread

set nobackup
set noswapfile

" http://vimpi.net/user/dubhead
set autochdir
set backupdir=~/.Trash,.,~/
set hidden

" }}}



" {{{ expression-commands

" netRW: Open files in a split window
"let g:netrw_browse_split = 1
let mapleader = ","

" }}}



" {{{ mappings

" save changes
noremap ,s :w<CR>

" exit vim without saving any changes
noremap ,q :q!<CR>

" exit vim saving changes
noremap ,w :x<CR>

" switch to upper/lower window quickly
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k

" map ,f to display all lines with keyword under cursor and ask which one to
" jump to
nnoremap ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" use <F6> to toggle line numbers
nnoremap <silent> <F6> :set number!<CR>

" open filename under cursor in a new window (use current file's working
" directory)
nnoremap gf :new %:p:h/<cfile><CR>

" map <Alt-p> and <Alt-P> to paste below/above and reformat
nnoremap <Esc>P  P'[v']=
nnoremap <Esc>p  p'[v']=

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" http://blog.blueblack.net/item_317
"nnoremap J jzz
nnoremap K kzz
noremap <CR> o<ESC>

noremap <Leader><Leader> :e .<CR>

" http://d.hatena.ne.jp/kozo-ni/20081028#1225205605
nnoremap <F5> :<C-u>execute '!' &l:filetype '%'<Return>

" Use CTRL-L for Escape
" http://twitter.com/emanon001/status/1022597622
vnoremap <silent> <C-l> <Esc>
inoremap <silent> <C-l> <Esc>
cnoremap <silent> <C-l> <C-c>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>
" http://whileimautomaton.net/2008/06/diary#d01-214900
nnoremap <C-h> :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help <C-r><C-w><Return>

" http://lab.hde.co.jp/2009/02/vimpython.html
"noremap <F5> :!/usr/bin/python %<CR>
noremap <F12> :!/usr/lib/python2.5/pdb.py %<CR>

" http://my.opera.com/jacob7908/blog/index.dml/tag/VIM
" pull full path name into paste buffer for attachment to email etc
nnoremap <F2> :let @p=expand("%:p")<CR>

" http://d.hatena.ne.jp/ns9tks/20081005/1223173570
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
noremap! <C-b> <Left>
noremap! <C-f> <Right>
noremap! <C-k> <Up>
noremap! <C-j> <Down>
noremap! <C-a> <Home>
noremap! <C-e> <End>
inoremap <silent> <expr> <C-e> (pumvisible() ? "\<C-e>" : "\<End>")
noremap! <C-d> <Del>

" azerty emulation
" http://vim.wikia.com/index.php?title=Invert_the_number_row_keys_for_faster_typing
" map each number to its shift-key character
"inoremap 1 !
"inoremap ! 1
"
"inoremap 2 ""<LEFT>
"inoremap " 2
"
"inoremap 3 #
"inoremap # 3
"
"inoremap 4 $
"inoremap $ 4
"noremap 4 $
"
"inoremap 5 %
"inoremap % 5
"
"inoremap 6 &
"inoremap & 6
"
"inoremap 7 ''<LEFT>
"inoremap ' 7
"
"inoremap 8 ()<LEFT>
"inoremap ( 8
"
"inoremap 9 )
"inoremap ) 9

noremap - :
"noremap : -

" http://vim.g.hatena.ne.jp/ka-nacht/20090624
noremap D d$

" :h scroll-smooth
map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

" }}}



" {{{ Generic highlight changes

set background=dark

" http://d.hatena.ne.jp/tasukuchan/20070816/1187246177
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhitespaceEOL /\s\+$/

"highlight Comment cterm=none ctermfg=Gray
"highlight IncSearch cterm=none ctermfg=Black ctermbg=DarkYellow
"highlight Search cterm=none ctermfg=Black ctermbg=DarkYellow
"highlight String cterm=none ctermfg=DarkGreen
"highlight treeDir cterm=none ctermfg=Cyan
"highlight treeUp cterm=none ctermfg=DarkYellow
"highlight treeCWD cterm=none ctermfg=DarkYellow
"highlight netrwDir cterm=none ctermfg=Cyan
" }}}



" {{{ Set up cscope options
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	cs add cscope.out
	set csverb
	map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
	map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
	map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
endif
" }}}



" {{{ FuzzyFinder

" http://gist.github.com/raw/4656/bb1aca94bbb12c866bdab00531b539ecd80670de
" http://vim.g.hatena.ne.jp/keyword/fuzzyfinder.vim

let g:fuf_modesDisable = []
let g:fuf_abbrevMap = {
    \   '^vr:' : map(filter(split(&runtimepath, ','), 'v:val !~ "after$"'), 'v:val . ''/**/'''),
    \   '^m0:' : [ '/mnt/d/0/', '/mnt/j/0/' ],
    \ }
let g:fuf_mrufile_maxItem = 300
let g:fuf_mrucmd_maxItem = 400
nnoremap <silent> <C-n>      :FufBuffer<CR>
nnoremap <silent> <C-p>      :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> <C-f><C-p> :FufFileWithFullCwd<CR>
nnoremap <silent> <C-f>p     :FufFile<CR>
nnoremap <silent> <C-f><C-d> :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> <C-f>d     :FufDirWithFullCwd<CR>
nnoremap <silent> <C-f>D     :FufDir<CR>
nnoremap <silent> <C-j>      :FufMruFile<CR>
nnoremap <silent> <C-k>      :FufMruCmd<CR>
nnoremap <silent> <C-b>      :FufBookmark<CR>
nnoremap <silent> <C-f><C-t> :FufTag<CR>
nnoremap <silent> <C-f>t     :FufTag!<CR>
noremap  <silent> g]         :FufTagWithCursorWord!<CR>
nnoremap <silent> <C-f><C-f> :FufTaggedFile<CR>
nnoremap <silent> <C-f><C-b> :FufAddBookmark<CR>
vnoremap <silent> <C-f><C-b> :FufAddBookmarkAsSelectedText<CR>
nnoremap <silent> <C-f><C-e> :FufEditInfo<CR>
nnoremap <silent> <C-f><C-r> :FufRenewCache<CR>

" }}}

" {{{ NERDTree

" Increase window size to 35 columns
let NERDTreeWinSize=35

" map <F7> to toggle NERDTree window
nmap <silent> <F7> :NERDTreeToggle<CR>

" }}}

" {{{ closetag
"autocmd FileType html,xml,xsl source ~/.vim/scripts/closetag.vim
" }}}

" autocmd {{{
" Go back to the position the cursor was on the last time this file was edited
" This autocommand jumps to the last known position in a file just after
" opening it, if the '" mark is set:
" ref. eval.txt line3756
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

autocmd FileType cvs :set fileencoding=euc-jp
autocmd FileType svn :set fileencoding=uft-8

autocmd FileType text setlocal spell spelllang=en_us

autocmd BufNewFile *.{py,R,rb,php,txt,css,htm*}{,.in} set fileencoding=utf-8

autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

autocmd FileType netrw nnoremap q :q<CR>

" http://paranoid.dip.jp/kaworu/2008-06-07-1.html
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen
" }}}

" abbreviations {{{
" :h type-mistakes
ab teh the
ab fro for
" }}}

