let g:mapleader = ";"

" window navigation
nnoremap <leader>h :wincmd h<cr>
nnoremap <leader>j :wincmd j<cr>
nnoremap <leader>k :wincmd k<cr>
nnoremap <leader>l :wincmd l<cr>

nmap <leader>rh :vertical resize +5<cr>
nmap <leader>rl :vertical resize -5<cr>
nmap <leader>rj :resize +5<cr>
nmap <leader>rk :resize -5<cr>

nmap <leader>w :w<cr>
nmap <leader>x :x<cr>
nmap <leader>q :q<cr>
nmap <leader>n :nohl<cr>

" copy paste to other programs via buffer '+'
" normal! \<C-v>
vmap <C-c> "+y
nmap <C-S-v> <ESC>"+p

" Denite/Defx/Deol: <leader>dX

" Sessions
nmap <leader>ss :SSave<cr>
nmap <leader>sc :SClose<cr>

" Git
nmap <leader>gs :G<cr>
nmap <leader>ga :G add %<cr>
nmap <leader>gd :G diff %<cr>
nmap <leader>gc :G commit<cr>
nmap <leader>gp :G push<cr>
nmap <leader>gu :G pull<cr>

nmap <leader>gh :diffget //2<cr>
nmap <leader>gl :diffget //3<cr>

" <leader>cX see :help nerdcommenter
