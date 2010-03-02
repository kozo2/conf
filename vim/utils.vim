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

" Show svn diff on footer.
" Language: svn
" Version: 0.1.0
" Author: thinca <thinca+vim@gmail.com>
" License: Creative Commons Attribution 2.1 Japan License
" <http://creativecommons.org/licenses/by/2.1/jp/deed.en>

"function! s:get_file_list()
"  let list = []
"  silent global/^M\>/call add(list, substitute(getline('.'), '^M\s*\(.*\)', '\1', ''))
"  return list
"endfunction
"
"
"
"if !exists('g:svn_diff_use_vimproc')
"  let g:svn_diff_use_vimproc = exists('*vimproc#system')
"endif
"function! s:system(list)
"  if g:svn_diff_use_vimproc
"    return vimproc#system(a:list)
"  endif
"  return system(join([a:list[0]] + map(a:list[1 :], 'shellescape(v:val)'), ' '))
"endfunction
"
"
"
"function! s:show_diff()
"  let list = s:get_file_list()
"  if empty(list)
"    return
"  endif
"  let lang = $LANG
"  let $LANG = 'C'
"  let diff = s:system(['svn', 'diff'] + list)
"  let $LANG = lang
"
"  $put =[]
"
"  let current_syntax = b:current_syntax
"  unlet! b:current_syntax
"  syntax include @svnDiff syntax/diff.vim
"  syntax region svnDiff start="^=\+$" end="^\%$" contains=@svnDiff
"  let b:current_syntax = current_syntax
"
"  $put = diff
"  global/^Index:/delete _
"endfunction
"
"call s:show_diff()

