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

source /opt/dots/vim/config/leader.vim
source /opt/dots/vim/config/dein.vim
source /opt/dots/vim/config/deol.vim
source /opt/dots/vim/config/defaults.vim
source /opt/dots/vim/config/theme.vim
source /opt/dots/vim/config/lsp.vim
source /opt/dots/vim/config/denite.vim
source /opt/dots/vim/config/deoplete.vim
source /opt/dots/vim/config/defx.vim
source /opt/dots/vim/config/easymotion.vim
source /opt/dots/vim/config/auto_pairs.vim

inoremap jk <Esc>
nmap <leader>v :e /opt/dots/vim/init.vim<cr>
