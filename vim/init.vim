" VIM configuration

if empty(glob('/opt/dots/vim/autoload/plug.vim'))
  silent !curl -fLo /opt/dots/vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('/opt/dots/vim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'NLKNguyen/c-syntax.vim'
Plug 'morhetz/gruvbox'
Plug 'lervag/vimtex'
Plug 'vim-scripts/gnuplot-syntax-highlighting'
Plug 'Shougo/defx.nvim'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'scrooloose/nerdcommenter' " <leader>cc and <leader>cu
Plug 'sbdchd/neoformat'
Plug 'davidhalter/jedi-vim'
Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'

call plug#end()

inoremap jk <Esc>
vnoremap <leader><leader> <Esc>

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
    \ '   __    ____  ____  ____  _  _  __  __  _  _  ____  __  __ ',
    \ '  /__\  (  _ \(_  _)(_  _)( \/ )|  \/  |( \/ )(_  _)(  \/  )',
    \ ' /(__)\  )   /  )(   _)(_  )  ( |      | \  /  _)(_  )    ( ',
    \ '(__)(__)(_)\_) (__) (____)(_/\_)|_/\/\_|  \/  (____)(_/\/\_)',
    \]
let g:startify_custom_header = startify#pad(g:ascii)
"""""""""""""" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#hunks#non_zero_only = 1
"""""""""""""" easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1 " Turn on case insensitive feature
"""""""""""""" Markdown config
let g:vim_markdown_folding_disabled = 1
"""""""""""""" Auto pairs
let g:AutoPairsFlyMode = 1
autocmd FileType java let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''", '\w\zs<' : '>'}
"""""""""""""" Latex
let g:tex_flavor = 'pdflatex'
autocmd FileType tex source /opt/dots/vim/autoload/latex.vim
" Python
autocmd FileType python source /opt/dots/vim/autoload/python.vim
" Misc
source /opt/dots/vim/autoload/leader.vim
source /opt/dots/vim/autoload/defaults.vim
source /opt/dots/vim/autoload/defx_config.vim
source /opt/dots/vim/autoload/denite_conf.vim
" source /opt/dots/vim/autoload/defx-git.vim
