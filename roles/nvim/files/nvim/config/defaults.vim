" solid underscore
let &t_SI .= "\<Esc>[4 q"
" solid block
let &t_EI .= "\<Esc>[2 q"

let &t_fe = "\<Esc>[?1004h"
let &t_fd = "\<Esc>[?1004l"

set clipboard+=unnamedplus
let loaded_matchparen = 1

" Required:
filetype plugin indent on
syntax enable

if has('termguicolors')
   set termguicolors
endif

" UI
hi CursorLine cterm=NONE ctermbg=8 ctermfg=NONE
hi Cursorline term=NONE cterm=NONE
hi LineNr ctermfg=grey
