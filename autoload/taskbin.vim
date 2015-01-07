"=============================================================================
" vim-taskbin - Add tasks to OmniFocus from Vim.
" Copyright (c) 2015 Scheakur <http://scheakur.com/>
" License: MIT license
"=============================================================================

let s:save_cpo = &cpo
set cpo&vim

function! s:cmd()
	return get(g:, 'taskbin_command', 'go-gmail2omnifocus')
endfunction


function! taskbin#post(text)
	if !executable(s:cmd())
		call s:show_error()
		return 0
	endif

	if empty(a:text)
		call winput#open('taskbin', function('s:write'), {
		\	'win_height': 1,
		\})
		return 0
	endif

	call s:write(a:text)
	return 1
endfunction


" internal functions {{{
function! s:show_error()
	echohl Error
	echomsg 'vim-taskbin needs `go-gmail2omnifocus` command.'
	echomsg 'Installation:'
	echomsg '> go get github.com/scheakur/go-gmail2omnifocus'
	echohl None
endfunction


function! s:write(text)
	call system(s:cmd() . ' ' . winput#escape(a:text))
endfunction
" }}}

let &cpo = s:save_cpo
unlet s:save_cpo
