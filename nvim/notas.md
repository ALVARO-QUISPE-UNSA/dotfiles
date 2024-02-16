OPCIONES DE PAZ, ESPECIALMENTE PARA PYTHON
syntax on
filetype plugin indent on
set tabstop=1 expandtab shiftwidth=2 smarttab softtabstop=0 
au FileType python set tabstop=1
au FileType python set shiftwidth=1
au FileType python set expandtab

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

au BufNewFile *.html -1r ~/.vim/templates/html.skel
au BufNewFile *.java -1r ~/.vim/templates/java.skel
au BufNewFile *.pl -1r ~/.vim/templates/perl.skel



