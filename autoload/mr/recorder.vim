function! mr#recorder#new(filename) abort
  return {
        \ '_timer': v:null,
        \ '_items': [],
        \ '_filename': a:filename,
        \ 'list': funcref('s:recorder_list'),
        \ 'record': funcref('s:recorder_record'),
        \}
endfunction

function! s:recorder_list() abort dict
  let filename = self._filename
  if !filereadable(filename)
    return []
  endif
  let items = filter(
        \ readfile(filename),
        \ '!empty(getftype(v:val))',
        \)
  return items
endfunction

function! s:recorder_record(filename) abort dict
  if getftype(a:filename) ==# ''
    return
  endif
  let filename = simplify(resolve(fnamemodify(a:filename, ':p')))
  call add(self._items, filename)
  call s:dump_delay(self)
endfunction

function! s:dump_delay(recorder) abort
  if a:recorder._timer isnot# v:null
    silent! call timer_stop(a:recorder._timer)
  endif
  let a:recorder._timer = timer_start(
        \ g:mr#delay,
        \ { -> s:dump(a:recorder) },
        \)
endfunction

function! s:dump(recorder) abort
  try
    let fname = a:recorder._filename
    let items = reverse(a:recorder._items) + a:recorder.list()
    call filter(items, s:uniq_f())
    call mkdir(fnamemodify(fname, ':h'), 'p', 0700)
    call writefile(items[: g:mr#threshold - 1], fname)
    let a:recorder._timer = v:null
    let a:recorder._items = []
  catch
    if &verbose
      echohl ErrorMsg
      echomsg v:exception
      echomsg v:throwpoint
      echohl None
    endif
  endtry
endfunction

function! s:uniq_f() abort
  let seen = {}
  return { k, v ->
        \ has_key(seen, v)
        \   ? 0
        \   : !empty(extend(seen, { v : 1 }))
        \}
endfunction
