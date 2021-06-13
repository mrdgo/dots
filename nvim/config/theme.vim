"""""""""""""" theme
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_termcolors = 256
let g:gruvbox_hls_cursor = 'green'

let g:airline_theme='base16_gruvbox_dark_hard'

let g:airline#extensions#tabline#ignore_bufadd_pat = '!|defx|gundo|nerd_tree|startify|tagbar|term://|undotree|vimfiler|dap-repl'

"let g:airline_symbols_ascii = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.colnr = ' ||:'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = ' ☰ '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

set background=dark
colorscheme gruvbox

nmap <Leader>bl <cmd>set background=light<cr>
nmap <Leader>bd <cmd>set background=dark<cr>

let g:Guifont="Mononki Nerd Font:13"

" transparent background
hi Normal guibg=NONE ctermbg=NONE

" Activate rainbow_parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
