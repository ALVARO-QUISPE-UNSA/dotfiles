"PENDIENTE:
"Poner en vez de tabnext, combinación de gt para poder poner números
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
nmap <Leader>ag :Ag<CR> 
nmap <Leader>g :GFiles?<CR> 
nmap <Leader>c :Commits<CR> 
nmap <Leader>no :call EnableBreakIndentation()<CR>

" VN
" Para que se copie el texto
vnoremap <Leader>yy "+y
" nnoremap <C-x> "+x            Supuestamente en el modo normal
"vnoremap <C-x> "+x                  " Para que se corte el texto

" N
"" aumentar de tamaño vista
nnoremap <Leader>> 6<C-w>>
"  para disminuir
nnoremap <Leader>< 6<C-w><
" para aumentar tamaño
nnoremap <Leader>+ 2<C-w>+
" para disminuir
nnoremap <Leader>- 2<C-w>-

" Path completion with custom source command
" inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
" inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
" Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-l> <plug>(fzf-complete-line)

" Word completion with custom spec with popup layout option
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})


" coc:
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


" Define a function to enable linebreak, breakindent, and breakindentopt
function! EnableBreakIndentation()
  set linebreak
  set breakindent
  set breakindentopt=shift:2
endfunction

" Map the function to a command for easy access
"command! Nt call EnableBreakIndentation()
