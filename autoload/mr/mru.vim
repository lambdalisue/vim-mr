let g:mr#mru#filename = get(g:, 'mr#mru#filename', '~/.cache/mr/mru')
let g:mr#mru#exclude = get(g:, 'mr#mru#exclude', '')
let s:mru = mr#recorder#new(expand(g:mr#mru#filename), {
      \ 'exclude': g:mr#mru#exclude,
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
