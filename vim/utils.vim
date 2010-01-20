" http://d.hatena.ne.jp/tasukuchan/20070816/1187246177
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhitespaceEOL /\s\+$/

" http://d.hatena.ne.jp/ns9tks/20091105/1257420345
augroup VimrcNetrw
  autocmd!
  autocmd FileType netrw let g:bufnrLastNetrw = bufnr('%')
augroup END

function s:openNetrw()
  if exists('g:bufnrLastNetrw')
    execute g:bufnrLastNetrw . 'buffer'
  else
    edit .
  endif
endfunction

nnoremap <Leader>- :call <SID>openNetrw()<CR>
