let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_json_checkers = ['jsonval']
let g:syntastic_aggregate_errors = 1

augroup javascript
  autocmd Filetype javascript setlocal autoindent shiftwidth=2 tabstop=2 expandtab
  autocmd FileType javascript noremap <buffer> <leader>m <Esc>:!make<CR>
augroup END

augroup json
  autocmd!
  autocmd FileType json noremap <buffer> <leader>t <Esc>:!node-test<CR>
  autocmd FileType json setlocal autoindent
  autocmd FileType json setlocal shiftwidth=2
  autocmd FileType json setlocal tabstop=2
  autocmd FileType json setlocal expandtab
  autocmd FileType json setlocal foldmethod=syntax
  autocmd FileType json setlocal formatprg=formatjson
augroup END

autocmd BufNewFile,BufRead *.json set filetype=json
autocmd BufNewFile,BufRead .eslintrc set filetype=json
autocmd BufNewFile,BufRead .jshintrc set filetype=json
autocmd BufNewFile,BufRead .jscsrc set filetype=json

