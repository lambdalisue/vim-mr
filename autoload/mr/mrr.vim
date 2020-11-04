let g:mr#mrr#filename = get(g:, 'mr#mrr#filename', '~/.cache/mr/mrr')
let s:mrr = mr#recorder#new(expand(g:mr#mrr#filename))

function! mr#mrr#list() abort
  return s:mrr.list()
endfunction

function! mr#mrr#start_recording() abort
  augroup mr-mrr-internal
    autocmd!
    autocmd VimEnter    * call s:record(getcwd())
    autocmd BufReadPost * call s:record(expand('%'))
    autocmd DirChanged  * call s:record(expand('<afile>'))
  augroup END
endfunction

function! mr#mrr#stop_recording() abort
  augroup mr-mrr-internal
    autocmd!
  augroup END
endfunction

function! s:record(path) abort
  let path = fnamemodify(a:path, ':p')
  let path = finddir('.git/..', path . ';')
  if path !=# ''
    call s:mrr.record(path)
  endif
endfunction
