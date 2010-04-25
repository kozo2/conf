let mapleader=" "

" shortcut to load vimrc
nnoremap <Leader>. :<C-u>edit ~/projects/conf/vim/.vimrc<Enter>

" edit file
nnoremap <Leader>e :e<Space>

" open current directory
nnoremap <Leader>d :edit .<CR>

" save changes
nnoremap <Leader>w :w<CR>

" exit vim without saving any changes
"nnoremap <Leader>q :q!<CR>

" exit vim saving changes
nnoremap <Leader>x :x<CR>

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

" http://d.hatena.ne.jp/kozo-ni/20081028#1225205605
nnoremap <F5> :<C-u>execute '!' &l:filetype '%'<Return>

" Use CTRL-L for Escape
" http://twitter.com/emanon001/status/1022597622
vnoremap <silent> <C-l> <Esc>
inoremap <silent> <C-l> <Esc>
cnoremap <silent> <C-l> <C-c>

" http://whileimautomaton.net/2008/06/diary#d01-214900
nnoremap <C-h> :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Return>

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
inoremap ' ''<LEFT>
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

" quick EX command for my key arrangement
noremap ; :
noremap : ;

" swap lines down-upward and display lines down-upward
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" quick date insert
inoremap <expr> ,df strftime('%Y-%m-%dT%H:%M:%S')
inoremap <expr> ,dd strftime('%Y-%m-%d')
inoremap <expr> ,dt strftime('%H:%M:%S')

" select last changed text
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<Enter>
onoremap gc :<C-u>normal gc<Enter>

" http://vim.g.hatena.ne.jp/ka-nacht/20090624
noremap D d$

" :h scroll-smooth
map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>
