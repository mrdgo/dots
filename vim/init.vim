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

source /opt/dots/vim/config/dein.vim
source /opt/dots/vim/config/defaults.vim
source /opt/dots/vim/config/theme.vim
source /opt/dots/vim/config/leader.vim
source /opt/dots/vim/config/lsp.vim
source /opt/dots/vim/config/denite.vim
source /opt/dots/vim/config/deoplete.vim
source /opt/dots/vim/config/defx_config.vim
source /opt/dots/vim/config/easymotion.vim
source /opt/dots/vim/config/auto_pairs.vim

autocmd FileType python source /opt/dots/vim/config/python.vim
autocmd FileType tex source /opt/dots/vim/autoload/latex.vim

inoremap jk <Esc>
