"""""""""""""" LATEX
let g:tex_flavor = 'xelatex'
let g:vimtex_view_general_viewer = 'zathura'

" Navigating with guides
inoremap ;aa <Esc>/<++><Enter>"_c4l
vnoremap ;aa <Esc>/<++><Enter>"_c4l
map <silent> ;aa <Esc>/<++><Enter>"_c4

nmap <silent> ;ap <cmd>VimtexCompile<cr>

" Code snippets
inoremap ;af \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
inoremap ;ac \cite{}<++><Esc>T{i
inoremap ;ae \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
inoremap ;ai \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
inoremap ;am \item<Space>
inoremap ;at \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
inoremap ;as \section{}<Enter><Enter><++><Esc>2kf}i
inoremap ;a2 \subsection{}<Enter><Enter><++><Esc>2kf}i
inoremap ;a3 \subsubsection{}<Enter><Enter><++><Esc>2kf}i
