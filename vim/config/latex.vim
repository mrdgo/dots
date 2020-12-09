"""""""""""""" LATEX

let g:livepreview_use_biber = 1
let g:tex_flavor = 'xelatex'
let g:livepreview_engine = 'xelatex' " . ' [options]'
let g:livepreview_previewer = 'zathura'
"let g:livepreview_texinputs = '/path1/to/files//:/path2/to/files//'

" Navigating with guides
inoremap <leader>g <Esc>/<++><Enter>"_c4l
vnoremap <leader>g <Esc>/<++><Enter>"_c4l
map <leader>g <Esc>/<++><Enter>"_c4l

" Code snippets
inoremap <leader>af \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
inoremap <leader>ac \cite{}<++><Esc>T{i
inoremap <leader>ae \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
inoremap <leader>ai \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
inoremap <leader>am \item<Space>
inoremap <leader>at \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
inoremap <leader>as \section{}<Enter><Enter><++><Esc>2kf}i
inoremap <leader>a2 \subsection{}<Enter><Enter><++><Esc>2kf}i
inoremap <leader>a3 \subsubsection{}<Enter><Enter><++><Esc>2kf}i

nmap <leader>ap :LLPStartPreview<cr>
