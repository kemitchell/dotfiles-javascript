let g:syntastic_javascript_checkers = ['standard']
"let g:syntastic_javascript_eslint_exe = 'eslint'
let g:syntastic_javascript_standard_generic = 1
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_aggregate_errors = 1

fu! JSSettings()
  nnoremap  <leader>i <Esc>:!npm i<CR>
endfu

augroup javascript
  autocmd Filetype javascript setlocal autoindent shiftwidth=2 tabstop=2 expandtab textwidth=72
  autocmd FileType javascript nnoremap <buffer> <leader>m <Esc>:!make<CR>
  autocmd FileType javascript call JSSettings()
  autocmd FileType javascript nnoremap <buffer> <leader>c <Esc>:!npm run coverage<CR>
  autocmd FileType javascript nnoremap <buffer> <leader>l <Esc>:!npm run lint<CR>
  autocmd FileType javascript nnoremap <buffer> <leader>f <Esc>:!npm run format<CR>
  autocmd FileType javascript setlocal spell
augroup END

autocmd BufNewFile,BufRead Jakefile set filetype=javascript

augroup json
  autocmd!
  autocmd FileType json setlocal autoindent
  autocmd FileType json setlocal shiftwidth=2
  autocmd FileType json setlocal tabstop=2
  autocmd FileType json setlocal expandtab
  autocmd FileType json setlocal foldmethod=syntax
  autocmd FileType json setlocal formatprg=json
  autocmd FileType json noremap <buffer> <leader>f <Esc>:%!formatjson<CR>
  autocmd FileType json noremap <buffer> <leader>l <Esc>:%!lamos-to-json<CR>
  autocmd FileType json call JSSettings()
augroup END

autocmd BufNewFile,BufRead *.json set filetype=json
autocmd BufNewFile,BufRead .eslintrc set filetype=json
autocmd BufNewFile,BufRead .jscsrc set filetype=json
autocmd BufNewFile,BufRead .jshintrc set filetype=json

augroup pegjs
  autocmd!
  autocmd FileType json setlocal autoindent
  autocmd FileType json setlocal shiftwidth=2
  autocmd FileType json setlocal tabstop=2
  autocmd FileType json setlocal expandtab
augroup END

autocmd BufNewFile,BufRead *.pegjs set filetype=pegjs

augroup markdown
  autocmd FileType markdown nnoremap <buffer> <leader>t <Esc>:!nodetest<CR>
  autocmd FileType markdown nnoremap <buffer> <leader>c <Esc>:!nodecoverage<CR>
augroup END
