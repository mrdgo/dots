"""""""""""""" LATEX
let g:vimtex_compiler_method = 'latexmk'
"let g:tex_flavor = 'pdflatex'
let g:vimtex_view_general_viewer = 'zathura'

set cc=-1
set spell

"let g:vimtex_quickfix_enabled = 0
nnoremap <Leader>vc <cmd>VimtexCompile<CR>
nnoremap ; A;<Esc>
inoremap ; <Esc>A;
