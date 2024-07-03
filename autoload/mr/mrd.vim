let g:mr#mrd#filename = get(g:, 'mr#mrd#filename', '~/.cache/mr/mrd')
let g:mr#mrd#predicates = get(g:, 'mr#mrd#predicates', [])
let s:mrd = mr#recorder#new(expand(g:mr#mrd#filename), {
      \ 'predicates': g:mr#mrd#predicates,
      \})

function! mr#mrd#list() abort
  return s:mrd.list()
endfunction

function! mr#mrd#start_recording() abort
  augroup mr-mrd-internal
    autocmd!
    autocmd VimEnter    * call s:record(getcwd())
    autocmd DirChanged  * call s:record(expand('<afile>'))
    autocmd VimLeave    * call s:mrd.dump()
  augroup END
endfunction

function! mr#mrd#stop_recording() abort
  augroup mr-mrd-internal
    autocmd!
  augroup END
endfunction

function! mr#mrd#delete(filename) abort
  return s:mrd.delete(a:filename)
endfunction

function! s:record(path) abort
  let path = fnamemodify(a:path, ':p')
  if isdirectory(path)
    call s:mrd.record(path)
  endif
endfunction
