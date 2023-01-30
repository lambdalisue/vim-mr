let g:mr#mrw#filename = get(g:, 'mr#mrw#filename', '~/.cache/mr/mrw')
let g:mr#mrw#predicates = get(g:, 'mr#mrw#predicates', [])
let s:mrw = mr#recorder#new(expand(g:mr#mrw#filename), {
      \ 'predicates': g:mr#mrw#predicates,
      \})

function! mr#mrw#list() abort
  return s:mrw.list()
endfunction

function! mr#mrw#start_recording() abort
  augroup mr-mrw-internal
    autocmd!
    autocmd BufWritePost * call s:mrw.record(expand('<afile>'))
    autocmd VimLeave     * call s:mrw.dump()
  augroup END
endfunction

function! mr#mrw#stop_recording() abort
  augroup mr-mrw-internal
    autocmd!
  augroup END
endfunction

function! mr#mrw#delete(filename) abort
  return s:mrw.delete(a:filename)
endfunction
