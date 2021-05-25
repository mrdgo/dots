"""""""""""""" LATEX
let g:tex_flavor = 'xelatex'
let g:vimtex_view_general_viewer = 'zathura'

let g:maplocalleader = "-"
set cc=-1

" Navigating with guides
inoremap <LocalLeader>aa <Esc>/<++><Enter>"_c4l
vnoremap <LocalLeader>aa <Esc>/<++><Enter>"_c4l
map <silent> <LocalLeader>aa <Esc>/<++><Enter>"_c4

nmap <silent> <LocalLeader>ap <cmd>VimtexCompile<cr>

" Code snippets
"inoremap <LocalLeader>af \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
inoremap <LocalLeader>af \begin{figure}<Enter>\centering<Enter>\includegraphics[scale=0.5]{}<Enter>\caption{<++>}<Enter>\label{<++>}<Enter>\end{figure}<Enter><Enter><++><Esc>5k$i
inoremap <LocalLeader>ac \cite{}<++><Esc>T{i
inoremap <LocalLeader>an \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
inoremap <LocalLeader>ae \begin{equation}<Enter>\centering<Enter>\label{}<Enter>\end{equation}<Enter><Enter><++><Esc>2kO
inoremap <LocalLeader>ai \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
inoremap <LocalLeader>am \item<Space>
inoremap <LocalLeader>at \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
inoremap <LocalLeader>as \section{}<Enter><Enter><++><Esc>2kf}i
inoremap <LocalLeader>a2 \subsection{}<Enter><Enter><++><Esc>2kf}i
inoremap <LocalLeader>a3 \subsubsection{}<Enter><Enter><++><Esc>2kf}i
