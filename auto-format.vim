" C/C++
function! CFmt()
	let l:cmd = executable('clang-format') ? 'clang-format' :  '' 
	if empty(l:cmd) | return | endif

	let l:view = winsaveview()
	execute 'silent %!' . l:cmd
	call winrestview(l:view)
endfunction

autocmd FileType c,cpp autocmd BufWritePre <buffer> call CFmt()

" Rust
function! RustFmt()
	let l:cmd = executable('rustfmt') ? 'rustfmt' :  '' 
	if empty(l:cmd) | return | endif

	let l:view = winsaveview()
	execute 'silent %!' . l:cmd
	call winrestview(l:view)
endfunction

autocmd FileType rust autocmd BufWritePre <buffer> call RustFmt()

" Golang
function! GoFmt()
	let l:cmd = executable('goimports') ? 'goimports' : (executable('gofmt') ? 'gofmt' : '') 
	if empty(l:cmd) | return | endif

	let l:view = winsaveview()
	execute 'silent %!' . l:cmd
	call winrestview(l:view)
endfunction

autocmd FileType go autocmd BufWritePre <buffer> call GoFmt()

" Python
function! PythonFmt()
	let l:cmd = executable('ruff') ? 'ruff format -' : (executable('black') ? 'black -q -' : '') 
	if empty(l:cmd) | return | endif

	let l:view = winsaveview()
	execute 'silent %!' . l:cmd
	call winrestview(l:view)
endfunction

autocmd FileType python autocmd BufWritePre <buffer> call PythonFmt()
