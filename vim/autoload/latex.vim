"""""""""""""" LATEX
let g:livepreview_previewer = 'zathura'

" Decide
"let g:neotex_pdflatex_alternative = 'xelatex'
let g:neotex_enabled = 2
let g:neotex_subfile = 1

let g:tex_flavor = 'latex'

" Navigating with guides
inoremap <Leader><Leader> <Esc>/<++><Enter>"_c4l
vnoremap <Leader><Leader> <Esc>/<++><Enter>"_c4l
map <Leader><Leader> <Esc>/<++><Enter>"_c4l
" Word count:
map <F3> :w !detex \| wc -w<CR>
inoremap <F3> <Esc>:w !detex \| wc -w<CR>
" Code snippets
inoremap <Leader>lf \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
inoremap <Leader>lc \cite{}<++><Esc>T{i
inoremap <Leader>le \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
inoremap <Leader>li \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
inoremap <Leader>lm \item<Space>
inoremap <Leader>lt \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
inoremap <Leader>ls \section{}<Enter><Enter><++><Esc>2kf}i
inoremap <Leader>l2 \subsection{}<Enter><Enter><++><Esc>2kf}i
inoremap <Leader>l3 \subsubsection{}<Enter><Enter><++><Esc>2kf}i

" Live preview
inoremap <leader>lp :NeoTexOn<cr>
nnoremap <leader>lp :NeoTexOn<cr>
