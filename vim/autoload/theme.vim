"""""""""""""" theme
set background=dark               " or light
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_termcolors = 256
let g:gruvbox_hls_cursor = 'green'
let g:airline_theme='base16_gruvbox_dark_hard'

"""""""""""""" startify
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_session_persistence = 1
let g:startify_session_number = 10
let g:startify_session_sort = 1
let g:startify_files_number = 10
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
      \ { 'type': 'dir',       'header': ['   Files '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ ]
let g:ascii = [
      \ '        __',
      \ '.--.--.|__|.--------.',
      \ '|  |  ||  ||        |',
      \ ' \___/ |__||__|__|__|',
      \ ''
      \]
let g:startify_custom_header = startify#pad(g:ascii)

"""""""""""""" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#hunks#non_zero_only = 1
