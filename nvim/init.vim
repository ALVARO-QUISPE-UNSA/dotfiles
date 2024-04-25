"Aquí están las conguraciones desde git
ru! defaults.vim                " Use Enhanced Vim defaults
set mouse=a                     " Usar el mouse en varios modos
aug vimStartup | au! | aug END  " Revert last positioned jump, as it is defined below
let g:skip_defaults_vim = 1     " Do not source defaults.vim again (after loading this system vimrc)

set ai                          " set auto-indenting on for programming
set showmatch                   " automatically show matching brackets. works like it does in bbedit.
set vb                          " turn on the "visual bell" - which is much quieter than the "audio blink"
set laststatus=2                " make the last line where the status is two lines deep so you can see status always
set showmode                    " show the current mode
set wildmode=list:longest,longest:full   " Better command line completion
"----------------------------------------------------------------------------
" Aquí estarán las configuraciones de mi Vim
set expandtab                   " Usar espacios
set tabstop=2                   " Establece la cantidad de espacios que representa un carácter de tabulación.
set shiftwidth=2                " Define la cantidad de espacios para cada nivel de indentación.
" OK, in python files I need to change in python.vim in
" /usr/share/nvim/runtime/ftplugin/python.vim
set autoindent
set softtabstop=2
set spelllang=es
set relativenumber 
set guicursor=n-v-c:block
set guicursor+=a:blinkon1
set number
set numberwidth=1
set clipboard=unnamed           "Debería dejarme copiar texto de la manera usual
if has("syntax")                "sintaxis
  syntax on
endif
set showcmd	                	" Show (partial) command in status line.
set smartcase	             	" Do smart case matching
set incsearch	            	" Incremental search
set autowrite		            " Automatically save before commands like :next and :make
set encoding=utf-8              
set laststatus=2
syntax enable
" PLUGS---------------------------------------------------------------
so ~/.config/nvim/my-plugins.vim
so ~/.config/nvim/maps.vim
call plug#begin('~/.config/nvim/plugged/')
Plug 'morhetz/gruvbox'                  " Tema
" Plug 'folke/tokyonight.nvim'
" Plug 'ghifarit53/tokyonight-vim'
Plug 'shinchu/lightline-gruvbox.vim'    " Tema para la barra de estado
Plug 'sheerun/vim-polyglot'             " Mejor resaltado de sintaxys
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'        " Para buscar facil
Plug 'christoomey/vim-tmux-navigator'   " Para oper tener pantalla partida
Plug 'jiangmiao/auto-pairs'             " Para que se cierren los paréntesis 
Plug 'alvan/vim-closetag'               " Para etiquetas html
Plug 'tpope/vim-surround'               " Para encapsular variables
Plug 'j-hui/vim-css-color'

Plug 'maximbaz/lightline-ale'           " Para barra de abajo
Plug 'itchyny/lightline.vim'            " Para colores barra de estado
" Plug 'mengelbrecht/lightline-bufferline'
Plug 'tpope/vim-fugitive'
"Plug 'dense-analysis/ale'              " Algún análisis después
Plug 'yggdroot/indentline'              " Para mostrar linea de indentar
Plug 'mattn/emmet-vim'                  " para html
"Plug 'vim-airline/vim-airline'          " Para barra airline
"Plug 'vim-airline/vim-airline-themes'   " Para los temas de airline
Plug 'tibabit/vim-templates'            " Para las plantillas
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'             " plug para los íconos -- es lento
Plug 'junegunn/goyo.vim'                " Plug to read very well
Plug 'neoclide/coc.nvim', {'branch': 'release'}   " coc to semantic support


" PENDIENTES POR VER
" Plug 'majutsushi/tagbar'              " Pane with tags para 'resumir' los métodos
" Plug 'rhysd/vim-grammarous'            " GrammarCheck using LanguageTool para verificar gramática
" https://neuron.zettel.page/zettelkasten -> para tomar notas
" Plug 'elzr/vim-json'                   " Better JSON support
" Plug 'frazrepo/vim-rainbow'                " Rainbow parentheses
" Plug 'vim-pandoc/vim-pandoc-syntax'    " Pandoc syntax
" Plug 'chrisbra/colorizer'              " Colorize color codes





call plug#end()
" --------------------------------------------------------------------

let g:gruvbox_contrast_dark= "hard" " Ponerle oscuro al tema
set background=dark
colorscheme gruvbox                 " Escoger el tema
" NO tener espefício en GUI ni terminales 256
hi Normal guibg=NONE ctermbg=NONE   
" CAMBIA: let s:gb.dark0_hard =[#1d2021] a let s:gb.dark0_hard =[#000000]
"let g:gruvbox_italic=1            " Para italic"
"set noshowmode
"set termguicolors
"let g:tokyonight_style = 'night' " available: night, storm
"let g:tokyonight_enable_italic = 1
"colorscheme tokyonight
"--------------------Teclas

let NERDTreeQuitOnOpen=1            " Para cerrar nerdtree
"---------------------------------------------------------------------
" Show EOL type and last modified timestamp, right after the filename
set statusline=%f               " filename relative to current $PWD
set statusline+=%h              " help file flag
set statusline+=%m              " modified flag
set statusline+=%r              " readonly flag
set statusline+=\ [%{&ff}]      " Fileformat [unix]/[dos] etc...
set statusline+=\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})  " last modified timestamp
set statusline+=%=              " Rest: right align
set statusline+=%l,%c%V         " Position in buffer: linenumber, column, virtual column
set statusline+=\ %P            " Position in buffer: Percentage

if &term =~ 'xterm-256color'    " mintty identifies itself as xterm-compatible
  if &t_Co == 8
    set t_Co = 256              " Use at least 256 colors
  endif
  " set termguicolors           " Uncomment to allow truecolors on mintty
endif
"------------------------------------------------------------------------------
" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Set UTF-8 as the default encoding for commit messages
    autocmd BufReadPre COMMIT_EDITMSG,MERGE_MSG,git-rebase-todo setlocal fileencoding=utf-8

    " Remember the positions in files with some git-specific exceptions"
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$")
      \           && &filetype !~# 'commit\|gitrebase'
      \           && expand("%") !~ "ADD_EDIT.patch"
      \           && expand("%") !~ "addp-hunk-edit.diff" |
      \   exe "normal! g`\"" |
      \ endif

      autocmd BufNewFile,BufRead *.patch set filetype=diff

      autocmd Filetype diff
      \ highlight WhiteSpaceEOL ctermbg=red |
      \ match WhiteSpaceEOL /\(^+.*\)\@<=\s\+$/
endif " has("autocmd")










" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set ignorecase		" Do case insensitive matching
"set hidden		" Hide buffers when they are abandoned

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
