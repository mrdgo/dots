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
nnoremap <leader>ds :<C-u>Denite grep:. -no-empty<cr>
nnoremap <leader>da :<C-u>DeniteCursorWord grep:.<cr>
nnoremap <leader>db :Denite buffer<cr>
nnoremap <leader>dc :Denite command_history<cr>
nnoremap <leader>dh :Denite help<cr>
nnoremap <leader>df :Denite file_mru file/rec<cr>
nnoremap <leader>dy :Denite neoyank -default-action=yank<cr>
nnoremap <leader>dl :Denite line<cr>

" Sessions
nmap <leader>ss :SSave<cr>
nmap <leader>sc :SClose<cr>

" Easymotion
map  f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)
nmap F <Plug>(easymotion-overwin-f2)

" Move to line
map <leader>L <Plug>(easymotion-bd-jk)
nmap <leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <leader><leader>w <Plug>(easymotion-bd-w)
nmap <leader><leader>w <Plug>(easymotion-overwin-w)

nmap <silent> <leader><c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nmap <silent> <leader>K     <cmd>lua vim.lsp.buf.hover()<CR>
nmap <silent> <leader>sd    <cmd>lua vim.lsp.buf.declaration()<CR>
nmap <silent> <leader>sD    <cmd>lua vim.lsp.buf.implementation()<CR>
nmap <silent> <leader>sD    <cmd>lua vim.lsp.buf.type_definition()<CR>
nmap <silent> <leader><c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
"nmap <silent> <leader>sr    <cmd>lua vim.lsp.buf.references()<CR>
nmap <silent> <leader>sr    <cmd>lua vim.lsp.buf.rename()<CR>
nmap <silent> <leader>s    <cmd>lua vim.lsp.buf.formatting()<CR>
nmap <silent> <leader>sn    <cmd>lua vim.lsp.diagnostic.goto_next()<cr>

" autoformat on save
autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()

" Git
nnoremap <leader>gs :G<cr>
nnoremap <leader>ga :G add %<cr>
nnoremap <leader>gd :G diff %<cr>
nnoremap <leader>gc :G commit<cr>
nnoremap <leader>gp :G push<cr>
nnoremap <leader>gu :G pull<cr>

" see :help nerdcommenter


" copy filename/full path
nmap <leader>yf :let @*=expand("%")<CR>
nmap <leader>yp :let @*=expand("%:p")<CR>
