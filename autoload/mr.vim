let s:ESCAPE_PATTERN = '^$~.*[]\'

function! mr#filter(list, path) abort
  let path = fnamemodify(simplify(a:path), ':p')
  let pattern = '^' . escape(path, s:ESCAPE_PATTERN)
  return filter(a:list, 'v:val =~# pattern')
endfunction

let g:mr#delay = get(g:, 'mr#delay', 200)
let g:mr#threshold = get(g:, 'mr#threshold', 1000)
