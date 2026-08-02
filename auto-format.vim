function! GoFmt()
	let l:cmd = executable('goimports') ? 'goimports' : (executable('gofmt') ? 'gofmt' : '') 
	if empty(l:cmd) | return | endif

	let l:view = winsaveview()
	execute 'silent %!' . l:cmd
	call winrestview(l:view)
endfunction

autocmd FileType go autocmd BufWritePre <buffer> call GoFmt()
