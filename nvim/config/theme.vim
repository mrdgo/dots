"""""""""""""" theme
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_termcolors = 256
let g:gruvbox_hls_cursor = 'green'

let g:airline_theme='base16_gruvbox_dark_hard'

set background=dark
colorscheme gruvbox

nmap <Leader>bl <cmd>set background=light<cr>
nmap <Leader>bd <cmd>set background=dark<cr>

" transparent background
hi Normal guibg=NONE ctermbg=NONE

" Activate rainbow_parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
