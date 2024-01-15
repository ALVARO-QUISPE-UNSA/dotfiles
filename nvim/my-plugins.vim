" Para airline
" Para lineas de indentado--------------------------------
let g:indentLine_char_list = ['│', '|']
" Para barra de estado de maximbaz
let g:lightline = {}
" Para rama main en barra de estado-----------------
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

