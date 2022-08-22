let g:mr#mrw#filename = get(g:, 'mr#mrw#filename', '~/.cache/mr/mrw')
let g:mr#mrw#predicate = get(g:, 'mr#mrw#predicate', v:null)
let s:mrw = mr#recorder#new(expand(g:mr#mrw#filename), {
      \ 'predicate': g:mr#mrw#predicate,
      \})

function! mr#mrw#list() abort
  return s:mrw.list()
endfunction

function! mr#mrw#start_recording() abort
  augroup mr-mrw-internal
    autocmd!
    autocmd BufWritePost * call s:mrw.record(expand('<afile>'))
  augroup END
endfunction

function! mr#mrw#stop_recording() abort
  augroup mr-mrw-internal
    autocmd!
  augroup END
endfunction
