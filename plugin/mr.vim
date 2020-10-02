if exists('g:loaded_mr')
  finish
endif
let g:loaded_mr = 1

if !get(g:, 'mr_mru_disabled')
  call mr#mru#start_recording()

  command! -bar Mru call setqflist([], ' ', {
        \  'title': 'mr:mru',
        \  'efm': '%f',
        \  'lines': mr#mru#list(),
        \})
endif

if !get(g:, 'mr_mrw_disabled')
  call mr#mrw#start_recording()

  command! -bar Mrw call setqflist([], ' ', {
        \  'title': 'mr:mrw',
        \  'efm': '%f',
        \  'lines': mr#mrw#list(),
        \})
endif
