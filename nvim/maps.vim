"EMMET VIM
let g:user_emmet_mode='nv'           "only enable normal mode functions.
let g:user_emmet_leader_key='<Space>y'

let mapleader=" "

nmap <Leader>nt :NERDTreeFind<CR>  
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>h :tabprevious<CR>     "Para regresar a otro tab
nmap <Leader>l :tabnext<CR>         "para ir a otro tab
nmap <Leader>s <Plug>(easymotion-overwin-f2)

" VN
vnoremap <C-c> "+y              " Para que se copie el texto
" nnoremap <C-x> "+x            Supuestamente en el modo normal
"vnoremap <C-x> "+x                  " Para que se corte el texto

" N
nnoremap <Leader>> 6<C-w>>      " aumentar de tamaño vista
nnoremap <Leader>< 6<C-w><      "  para disminuir
nnoremap <Leader>+ 2<C-w>+       " para aumentar tamaño
nnoremap <Leader>- 2<C-w>-       " para disminuir

