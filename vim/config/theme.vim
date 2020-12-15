"""""""""""""" theme
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_termcolors = 256
let g:gruvbox_hls_cursor = 'green'
set background=dark
colorscheme gruvbox
let g:airline_theme='base16_gruvbox_dark_hard'

" transparent background
" hi Normal guibg=NONE ctermbg=NONE

" Activate rainbow_parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"""""""""""""" startify
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_session_persistence = 1
let g:startify_session_number = 10
let g:startify_session_sort = 0
let g:startify_custom_indices = ['g', '4', 'v', 't', 'x', 'z']
let g:startify_files_number = 10
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ ]
let g:ascii = [
      \ ' ...      (^~^)                              ',
      \ '(°з°)  _ ┐__\|_┌________ __   __ ___ __   __ ',
      \ '|  |  | |       |       |  | |  |   |  |_|  |',
      \ '|   |_| |    ___|  ___  |  |_|  |   |       |',
      \ '|       |   |___| |▀-▀| |       |   |       |',
      \ '|  _    |    ___| |___| |       |   |       |',
      \ '| | |   |   |___|       ||     ||   | ||_|| |',
      \ '|_|  |__|_______|_______| |___| |___|_|   |_|',
      \ ''
      \]
let g:startify_custom_header = startify#pad(g:ascii)

"""""""""""""" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#hunks#non_zero_only = 1

"""""""""""""" Semshi
lua require'colorizer'.setup()
function MyCustomHighlights()
    hi semshiLocal           ctermfg=209 guifg=#d65d0e
    hi semshiGlobal          ctermfg=214 guifg=#8ec07c
    hi semshiImported        ctermfg=214 guifg=#8ec07c cterm=bold gui=bold
    hi semshiParameter       ctermfg=75  guifg=#83a598
    hi semshiParameterUnused ctermfg=117 guifg=#458588 cterm=underline gui=underline
    hi semshiFree            ctermfg=218 guifg=#d3869b
    hi semshiBuiltin         ctermfg=207 guifg=#b16286
    hi semshiAttribute       ctermfg=49  guifg=#fe8019
    hi semshiSelf            ctermfg=249 guifg=#fb4934
    hi semshiUnresolved      ctermfg=226 guifg=#fabd2f cterm=underline gui=underline
    hi semshiSelected        ctermfg=231 guifg=#ebdbb2 ctermbg=161 guibg=#b57614

    hi semshiErrorSign       ctermfg=231 guifg=#ebdbb2 ctermbg=160 guibg=#fb4934
    hi semshiErrorChar       ctermfg=231 guifg=#ebdbb2 ctermbg=160 guibg=#fb4934
    sign define semshiError text=E> texthl=semshiErrorSign
endfunction
autocmd FileType python call MyCustomHighlights()
