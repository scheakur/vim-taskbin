"=============================================================================
" vim-taskbin - Add tasks to OmniFocus from Vim.
" Copyright (c) 2015 Scheakur <http://scheakur.com/>
" License: MIT license
"=============================================================================

if exists('g:loaded_taskbin')
	finish
endif
let g:loaded_taskbin = 1

let s:save_cpo = &cpo
set cpo&vim

function! s:taskbin(args)
	if taskbin#post(a:args)
		redraw!
	endif
endfunction

command! -nargs=? Taskbin call s:taskbin(<q-args>)

nnoremap <silent> <Plug>(taskbin)  :<C-u>Taskbin<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
