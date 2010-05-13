" Expert Python Programming p26
set textwidth=0
set tabstop=4
set softtabstop=4
set shiftwidth=4

inoremap <buffer> <expr> = smartchr#loop(' = ', ' == ', '=')
inoremap <buffer> <expr> + smartchr#loop(' + ', '+')
inoremap <buffer> <expr> , smartchr#loop(', ', ',')
