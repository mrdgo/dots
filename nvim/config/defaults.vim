set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set hls is
set ignorecase
set smartindent
set hidden
set laststatus=2
set cc=80
set splitbelow

" solid underscore
let &t_SI .= "\<Esc>[4 q"
" solid block
let &t_EI .= "\<Esc>[2 q"

set clipboard+=unnamedplus
let loaded_matchparen = 1

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

" Required:
filetype plugin indent on
syntax enable

if has('termguicolors')
   set termguicolors
endif

" UI
set number
set showcmd
set wildmenu
set lazyredraw
set cursorline
hi CursorLine   cterm=NONE ctermbg=8 ctermfg=NONE
hi Cursorline term=NONE cterm=NONE
hi LineNr ctermfg=grey
