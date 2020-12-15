"
"     ...      ('~')
"    (°з°)  _ ┐__\|_┌________ __   __ ___ __   __
"    |  |  | |       |       |  | |  |   |  |_|  |
"    |   |_| |    ___|  ___  |  |_|  |   |       |
"    |       |   |___| |▀-▀| |       |   |       |
"    |  _    |    ___| |___| |       |   |       |
"    | | |   |   |___|       ||     ||   | ||_|| |
"    |_|  |__|_______|_______| |___| |___|_|   |_|
"
if &compatible
    set nocompatible
endif

source /opt/dots/nvim/config/leader.vim
source /opt/dots/nvim/config/dein.vim
source /opt/dots/nvim/config/deol.vim
source /opt/dots/nvim/config/defaults.vim
source /opt/dots/nvim/config/theme.vim
source /opt/dots/nvim/config/lsp.vim
source /opt/dots/nvim/config/denite.vim
source /opt/dots/nvim/config/deoplete.vim
source /opt/dots/nvim/config/defx.vim
source /opt/dots/nvim/config/easymotion.vim
source /opt/dots/nvim/config/auto_pairs.vim

inoremap jk <Esc>
nmap <leader>v :e /opt/dots/nvim/init.vim<cr>
