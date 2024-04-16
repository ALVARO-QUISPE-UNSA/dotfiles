"EMMET VIM
let g:user_emmet_mode='nv'           "only enable normal mode functions.
let g:user_emmet_leader_key='<Space>y'

let mapleader=" "

nmap <Leader>nt :NERDTreeFind<CR>  
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
"Para regresar a otro tab:
nmap <Leader>h :tabprevious<CR>
"para ir a otro tab:
nmap <Leader>l :tabnext<CR>
"para abrir nuevo tab:
nmap <Leader>t :tabe 
nmap <Leader>s <Plug>(easymotion-overwin-f2)
nmap <Leader>mt :call MyTemplateInit(input("My template :D "))<CR>
nmap <Leader>ff :Files<CR> 
nmap <Leader>fg :GFiles<CR> 
nmap <Leader>fb :Buffers<CR> 
nmap <Leader>g :GFiles?<CR> 
nmap <Leader>c :Commits<CR> 

" VN
" Para que se copie el texto
vnoremap <Leader>yy "+y
" nnoremap <C-x> "+x            Supuestamente en el modo normal
"vnoremap <C-x> "+x                  " Para que se corte el texto

" N
nnoremap <Leader>> 6<C-w>>      " aumentar de tamaño vista
nnoremap <Leader>< 6<C-w><      "  para disminuir
nnoremap <Leader>+ 2<C-w>+       " para aumentar tamaño
nnoremap <Leader>- 2<C-w>-       " para disminuir

" Path completion with custom source command
" inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
" inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
" Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-l> <plug>(fzf-complete-line)

" Word completion with custom spec with popup layout option
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
