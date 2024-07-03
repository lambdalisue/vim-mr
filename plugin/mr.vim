if exists('g:loaded_mr')
  finish
endif
let g:loaded_mr = 1

if !get(g:, 'mr_mru_disabled')
  call mr#mru#start_recording()
endif

if !get(g:, 'mr_mrw_disabled')
  call mr#mrw#start_recording()
endif

if !get(g:, 'mr_mrr_disabled')
  call mr#mrr#start_recording()
endif

if !get(g:, 'mr_mrd_disabled')
  call mr#mrd#start_recording()
endif
