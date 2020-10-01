if exists('g:loaded_mr')
  finish
endif
let g:loaded_mr = 1

function! s:parse_action(args) abort
  let m = matchstr(a:args, '-\zs[arf]')
  return m==# '' ? ' ' : m
endfunction

function! s:complete(arglead, cmdline, cursorpos) abort
  let pattern = '^' . a:arglead
  if a:arglead =~# '^-'
    let candidates = ['-a', '-r', '-f']
    return filter(candidates, { _, v -> v =~# pattern })
  endif
  return []
endfunction

if !get(g:, 'mr_mru_disabled')
  call mr#mru#start_recording()

  command! -nargs=? -bar -complete=customlist,s:complete
        \ Mru call setqflist([], s:parse_action(<q-args>), {
        \   'title': 'mr:mru',
        \   'efm': '%f',
        \   'lines': mr#mru#list(),
        \ },
        \)
endif

if !get(g:, 'mr_mrw_disabled')
  call mr#mrw#start_recording()

  command! -nargs=? -bar -complete=customlist,s:complete
        \ Mrw call setqflist([], s:parse_action(<q-args>), {
        \   'title': 'mr:mrw',
        \   'efm': '%f',
        \   'lines': mr#mrw#list(),
        \ },
        \)
endif
