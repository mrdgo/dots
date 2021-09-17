"""""""""""""" theme
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_termcolors = 256
let g:gruvbox_hls_cursor = 'green'

let g:airline_theme='base16_gruvbox_dark_hard'

let g:airline#extensions#tabline#ignore_bufadd_pat = '!|nvim-tree|gundo|startify|tagbar|term://|undotree|dap-repl'

set background=dark
colorscheme gruvbox

nmap <Leader>bl <cmd>set background=light<cr>
nmap <Leader>bd <cmd>set background=dark<cr>

let g:Guifont="Mononki Nerd Font:13"

" transparent background
hi Normal guibg=NONE ctermbg=NONE
