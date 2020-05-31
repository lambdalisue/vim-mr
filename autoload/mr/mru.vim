let g:mr#mru#filename = get(g:, 'mr#mru#filename', '~/.cache/mr/mru')
let s:mru = mr#_new(expand(g:mr#mru#filename))

function! mr#mru#list() abort
  return s:mru.list()
endfunction

function! mr#mru#start_recording() abort
  augroup mr-mru-internal
    autocmd! *
    autocmd BufReadPost * call s:mru.record(expand('<afile>:p'))
  augroup END
endfunction

function! mr#mru#stop_recording() abort
  augroup mr-mru-internal
    autocmd! *
  augroup END
endfunction
