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

if !get(g:, 'mr_disable_warning')
  echohl WarningMsg
  echomsg '[mr] Default branch has been changed from master to main.'
  echomsg '[mr] Please change your reference branch to main to keep up with the latest changes.'
  echomsg '[mr] Disable this warning message by `let g:mr_disable_warning = 1`.'
  echohl None
endif
