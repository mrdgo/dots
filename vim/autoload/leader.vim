let g:mapleader = ";"

" window navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

nnoremap <leader>w :w<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>n :nohl<cr>

" copy paste to other programs via buffer '+'
" normal! \<C-v>
vnoremap <C-c> "+y
nnoremap <C-S-v> <ESC>"+p

" Defx
nnoremap <leader>de :Defx<cr>

" Denite
nnoremap <leader>dr :Denite -resume<cr>
nnoremap <leader>df :Denite file/rec<cr>

nnoremap <leader>ds :<C-u>Denite grep:. -no-empty<cr>
nnoremap <leader>da :<C-u>DeniteCursorWord grep:.<cr>
nnoremap <leader>db  :Denite buffer<cr>

" Easymotion
nnoremap <leader>f <Plug>(easymotion-overwin-f)

" jedi-vim
let g:jedi#rename_command = ';pr'
let g:jedi#goto_stubs_command = ';ps'
let g:jedi#goto_command = ';pd'
let g:jedi#goto_assignments_command = ';pg'
let g:jedi#usages_command = ';pn'

" see :help nerdcommenter
