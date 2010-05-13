" Go back to the position the cursor was on the last time this file was edited
" This autocommand jumps to the last known position in a file just after
" opening it, if the '" mark is set:
" ref. eval.txt line3756
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

autocmd FileType netrw nmap <buffer> f <cr>

" http://paranoid.dip.jp/kaworu/2008-06-07-1.html
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep copen
