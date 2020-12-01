" VIM configuration

if empty(glob('/opt/dots/vim/autoload/plug.vim'))
  silent !curl -fLo /opt/dots/vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('/opt/dots/vim/plugged')

Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'lervag/vimtex'
Plug 'plasticboy/vim-markdown'

Plug 'scrooloose/nerdcommenter' " <leader>cc and <leader>cu
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'

Plug 'tpope/vim-fugitive'

Plug 'Shougo/defx.nvim'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-git'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'

Plug 'sbdchd/neoformat'
Plug 'neomake/neomake'
Plug 'drinksober/nvim-yapf-formater'

Plug 'davidhalter/jedi-vim'
Plug 'NLKNguyen/c-syntax.vim'
Plug 'vim-scripts/gnuplot-syntax-highlighting'

Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

inoremap jk <Esc>
vnoremap <leader><leader> <Esc>

"""""""""""""" easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1 " Turn on case insensitive feature
"""""""""""""" Markdown config
let g:vim_markdown_folding_disabled = 1
"""""""""""""" Auto pairs
let g:AutoPairsFlyMode = 1
autocmd FileType java let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''", '\w\zs<' : '>'}
let g:tex_flavor = 'pdflatex'
autocmd FileType tex source /opt/dots/vim/autoload/latex.vim
" Python
autocmd FileType python source /opt/dots/vim/autoload/python.vim
" Misc
source /opt/dots/vim/autoload/theme.vim
source /opt/dots/vim/autoload/leader.vim
source /opt/dots/vim/autoload/defaults.vim
source /opt/dots/vim/autoload/denite_conf.vim
source /opt/dots/vim/autoload/defx_config.vim
