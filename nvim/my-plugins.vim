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

" Para mi configuración de plantillas
let g:tmpl_search_paths = ['~/.config/nvim/templates']
let g:tmpl_auto_initialize = 0

function! MyTemplateInit(arg)
      execute ':TemplateInit ' . a:arg
endfunction
