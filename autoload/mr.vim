let g:mr#delay = get(g:, 'mr#delay', 200)
let g:mr#threshold = get(g:, 'mr#threshold', 1000)

function! mr#_new(filename) abort
  call mkdir(fnamemodify(a:filename, ':p:h'), 'p', 0700)
  return {
        \ '_timer': v:null,
        \ '_candidates': [],
        \ '_filename': a:filename,
        \ 'list': funcref('s:recorder_list'),
        \ 'record': funcref('s:recorder_record'),
        \}
endfunction

function! s:recorder_list() abort dict
  let filename = self._filename
  return filereadable(filename)
        \ ? filter(readfile(filename), { -> filereadable(v:val) })
        \ : []
endfunction

function! s:recorder_record(filename) abort dict
  if !filereadable(a:filename)
    return
  endif
  call add(self._candidates, a:filename)
  call s:record_delay(self)
endfunction

function! s:record_delay(recorder) abort
  if a:recorder._timer isnot# v:null
    silent! call timer_stop(a:recorder._timer)
  endif
  let a:recorder._timer = timer_start(
        \ g:mr#delay,
        \ { -> s:record(a:recorder) },
        \)
endfunction

function! s:record(recorder) abort
  try
    let fname = a:recorder._filename
    let content = a:recorder._candidates + a:recorder.list()
    let content = s:uniq(content[: g:mr#threshold - 1])
    call mkdir(fnamemodify(fname, ':h'), 'p', 0700)
    call writefile(content, fname)
    let a:recorder._timer = v:null
    let a:recorder._candidates = []
  catch
    if &verbose
      echohl ErrorMsg
      echomsg v:exception
      echomsg v:throwpoint
      echohl None
    endif
  endtry
endfunction

function! s:uniq(candidates) abort
  let seen = {}
  let candidates = []
  for candidate in a:candidates
    if has_key(seen, candidate)
      continue
    endif
    let seen[candidate] = 1
    call add(candidates, candidate)
  endfor
  return candidates
endfunction
