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

" Sessions
nmap <leader>ss :SSave<cr>
nmap <leader>sc :SClose<cr>

" Easymotion
map  <leader>f <Plug>(easymotion-bd-f)
nmap <leader>f <Plug>(easymotion-overwin-f)

" jedi-vim
let g:jedi#rename_command = ';pr'
let g:jedi#goto_stubs_command = ';ps'
let g:jedi#goto_command = ';pd'
let g:jedi#goto_assignments_command = ';pg'
let g:jedi#usages_command = ';pn'

nnoremap <leader>py :YapfFormat<cr>
vnoremap <leader>py :YapfFormat 'full'<cr>

" Git
nnoremap <leader>gs :G<cr>
nnoremap <leader>ga :G add %<cr>
nnoremap <leader>gd :G diff %<cr>
nnoremap <leader>gc :G commit<cr>
nnoremap <leader>gp :G push<cr>
nnoremap <leader>gu :G pull<cr>

" see :help nerdcommenter
