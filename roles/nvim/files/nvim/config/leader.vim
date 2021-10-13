" window navigation
nnoremap <silent> <Leader>h <cmd>wincmd h<cr>
nnoremap <silent> <Leader>j <cmd>wincmd j<cr>
nnoremap <silent> <Leader>k <cmd>wincmd k<cr>
nnoremap <silent> <Leader>l <cmd>wincmd l<cr>

nmap <silent> <Leader>rh <cmd>vertical resize +5<cr>
nmap <silent> <Leader>rl <cmd>vertical resize -5<cr>
nmap <silent> <Leader>rj <cmd>resize +5<cr>
nmap <silent> <Leader>rk <cmd>resize -5<cr>

nmap <silent> <Leader>w <cmd>w<cr>
nmap <silent> <Leader>x <cmd>x<cr>
nmap <silent> <Leader>q <cmd>q<cr>

" Telescope: <Leader>fX
" LSP: <Leader>sX
" DAP: <Leader>dX

" Git
nmap <silent> <Leader>g <cmd>G<cr>
nmap <silent> <Leader>ga <cmd>G add %<cr>
nmap <silent> <Leader>gd <cmd>G diff %<cr>
nmap <silent> <Leader>gc <cmd>G commit<cr>
nmap <silent> <Leader>gp <cmd>G push<cr>
nmap <silent> <Leader>gu <cmd>G pull<cr>

nmap <silent> <Leader>gh <cmd>diffget //2<cr>
nmap <silent> <Leader>gs <cmd>diffget //3<cr>

" <Leader>cX see :help nerdcommenter
