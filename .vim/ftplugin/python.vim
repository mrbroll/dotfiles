"indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4

"mark column 99 for line length reference
set colorcolumn=120
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,E225'

"fix python indentation
let g:pyindent_open_paren = '&sw * 1'
let g:pyindent_nested_paren = '&sw * 1'
let g:pyindent_continue = '&sw * 1'

