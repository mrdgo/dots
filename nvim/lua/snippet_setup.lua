--require'snippets'.snippets = {
  -- The _global dictionary acts as a global fallback.
  -- If a key is not found for the specific filetype, then
  --  it will be lookup up in the _global dictionary.
  --_global = {
    -- Evaluate at the time of the snippet expansion and insert it. You
    --  can put arbitrary lua functions inside of the =... block as a
    --  dynamic placeholder. In this case, for an anonymous variable
    --  which doesn't take user input and is evaluated at the start.
    --epoch = "${=os.time()}";
    -- Equivalent to above.
    --epoch = function() return os.time() end;

    -- Use the expansion to read the username dynamically.
    --note = [[NOTE(${=io.popen("id -un"):read"*l"}): ]];

    -- Do the same as above, but by using $1, we can make it user input.
    -- That means that the user will be prompted at the field during expansion.
    -- You can *EITHER* specify an expression as a placeholder for a variable
    --  or a literal string/snippet using `${var:...}`, but not both.
    --note = [[NOTE(${1=io.popen("id -un"):read"*l"}): ]];
  --};
  --lua = {
    -- Snippets can be used inside of placeholders, but the variables used in
    -- the placeholder *must* be used outside of the placeholder. This could
    -- potentially change in the future if someone convinces me it's a good
    -- idea to support it. (it was a deliberate choice)
    --req = [[local ${2:$1} = require '$1']];

    -- A snippet with a placeholder using :... and multiple variables.
    --["for"] = "for ${1:i}, ${2:v} in ipairs(${3:t}) do\n$0\nend";
    -- This is equivalent to above, but looks nicer (to me) using [[]] strings.
    -- Notice $0 to indicate where the cursor should go at the end of expansion.
    --["for"] = [[
--for ${1:i}, ${2:v} in ipairs(${3:t}) do
--  $0
--end]];
--  };
--}

-- And now for some examples of snippets I actually use.
local snippets = require'snippets'
local U = require'snippets.utils'
snippets.snippets = {
  _global = {
    todo = U.force_comment 'TODO (maxim): ';
  };
  python = {
    newfile = "'''\ncreated: ${=os.date('%b %dth %Y')}\n@author: Maxim Ritter von Onciul\n'''";
    class = 'class ${1}(${2}):\n    def __init__():\n        $0';
    func = U.match_indentation 'def ${1}(${2}):\n    $0';
    ["for"] = U.match_indentation 'for ${1} in ${2}:\n    ';
  };
  tex = {
    figure = U.match_indentation [[
\begin{figure}
    \centering
    \includegraphics[scale=0.5]{${1}}
    \caption{${2}}
    \label{fig:${3}}
\end{figure}]];
    cite = '\\cite{$0}';
    label = '\\label{$0}';
    ref = '\\ref{$0}';
    enumerate = U.match_indentation [[
\begin{enumerate}[itemsep=2pt,parsep=2pt]
    $0
\end{enumerate}]];
    equation = [[
\begin{equation}
    \centering
    \label{eq:${1}}
    $0
\end{equation}]];
    itemize = U.match_indentation [[
\begin{itemize}[itemsep=2pt,parsep=2pt]
    $0
\end{itemize}
]];
    item = U.match_indentation '\\item $0';
    hline = '\\hline';
    tabular = U.match_indentation [[
\vspace{0.3cm}
\begin{table}[ht]
    \begin{tabular}{$1}
        $0
    \end{tabular}
    \caption{${2}}
    \label{tab:${3}}
\end{table}
\vspace{0.3cm}
    ]];
    section = '\\section{$1}\n\n$0';
    subsection = '\\subsection{$1}\n\n$0';
    subsubsection = '\\subsubsection{$1}\n\n$0';
    paragraph = '\\paragraph{$1}\n$0';
    texttt = '\\texttt{$0}';
    textbf = '\\textbf{$0}';
    vspace = '\\vspace{${1}cm}';
    hspace = '\\hspace{${1}cm}';
    mathcal = '\\mathcal{$0}';
    text = '\\text{$0}';
    rightarrow = '\\rightarrow';
    Rightarrow = '\\Rightarrow';
    leftarrow = '\\leftarrow';
    Leftarrow = '\\Leftarrow';
    sigma = '\\simga';
    tau = '\\tau';
    lambda = '\\lambda';
    forall = '\\forall';
    frac = '\\frac{${1}}{${2}} ';
    sum = '\\sum_{${1}}^{${2}} ';
    algorithm = U.match_indentation [[
\begin{algorithm}
    \caption{${1}}
    \label{alg:${2}}
    \begin{algorithmic}
        $0
    \end{algorithmic}
\end{algorithm}
    ]];
    tikzpicture = [[
\begin{figure}[${1:ht}]
    \centering
    \begin{tikzpicture}[shorten >=1pt]
        $0
    \end{tikzpicture}
    \caption{${2}}
    \label{${3}}
\end{figure}
    ]];
  };
}
