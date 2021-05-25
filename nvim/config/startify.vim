"""""""""""""" startify
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_session_persistence = 1
let g:startify_session_number = 10
let g:startify_session_sort = 0
let g:startify_custom_indices = ['b', 'f', 'g', '4', 'm', 'n', 'v', 't', 'x', 'z']
let g:startify_files_number = 10
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ ]
let g:ascii = [
      \ '',
      \ ' ...      (^~^)                              ',
      \ '(°з°)  _ ┐__\|_┌________ __   __ ___ __   __ ',
      \ '|  |  | |       |       |  | |  |   |  |_|  |',
      \ '|   |_| |    ___|  ___  |  |_|  |   |       |',
      \ '|       |   |___| |▀-▀| |       |   |       |',
      \ '|  _    |    ___| |___| |       |   |       |',
      \ '| | |   |   |___|       ||     ||   | ||_|| |',
      \ '|_|  |__|_______|_______| |___| |___|_|   |_|',
      \ '',
      \ '',
      \ ''
      \]
let g:startify_custom_header = startify#pad(g:ascii +
    \ split(system('motivate --no-colors'), '\n'))
