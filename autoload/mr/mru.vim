let g:mr#mru#filename = get(g:, 'mr#mru#filename', '~/.cache/mr/mru')
let g:mr#mru#predicates = get(g:, 'mr#mru#predicates', [])
let s:mru = mr#recorder#new(expand(g:mr#mru#filename), {
      \ 'predicates': g:mr#mru#predicates,
      \})

function! mr#mru#list() abort
  return s:mru.list()
endfunction

function! mr#mru#start_recording() abort
  augroup mr-mru-internal
    autocmd!
    autocmd BufReadPost * call s:mru.record(expand('<afile>'))
  augroup END
endfunction

function! mr#mru#stop_recording() abort
  augroup mr-mru-internal
    autocmd!
  augroup END
endfunction
