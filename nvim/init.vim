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

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
    set nocompatible
endif

let g:mapleader = " "

source $HOME/.config/nvim/config/leader.vim
source $HOME/.config/nvim/config/dein.vim
source $HOME/.config/nvim/config/deol.vim
source $HOME/.config/nvim/config/defaults.vim
source $HOME/.config/nvim/config/theme.vim
source $HOME/.config/nvim/config/airline.vim
source $HOME/.config/nvim/config/startify.vim
source $HOME/.config/nvim/config/semshi.vim
source $HOME/.config/nvim/config/easymotion.vim
source $HOME/.config/nvim/config/deoplete.vim
source $HOME/.config/nvim/config/defx.vim
source $HOME/.config/nvim/config/auto_pairs.vim
"source $HOME/.config/nvim/config/tools.vim
source $HOME/.config/nvim/config/markdown.vim
source $HOME/.config/nvim/config/denite.vim
source $HOME/.config/nvim/config/commenter.vim
source $HOME/.config/nvim/config/doge.vim

luafile $HOME/.config/nvim/lua/lsp_setup.lua
"luafile $HOME/.config/nvim/lua/telescope_setup.lua

luafile $HOME/.config/nvim/lua/dap_setup.lua
luafile $HOME/.config/nvim/lua/dap_python.lua

inoremap jk <Esc>
nmap <silent> <leader>v :e $MYVIMRC<cr>
nmap <leader>r :so $MYVIMRC<cr>
