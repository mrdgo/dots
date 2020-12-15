set runtimepath+=/opt/dots/vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/opt/dots/vim/dein')
  call dein#begin('/opt/dots/vim/dein')

  call dein#add('/opt/dots/vim/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/defx.nvim')
  call dein#add('Shougo/deol.nvim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/deoplete-lsp')
  call dein#add('deoplete-plugins/deoplete-zsh')
  call dein#add('neovim/nvim-lspconfig')
  call dein#add('Shougo/neoyank.vim')
  call dein#add('Shougo/neomru.vim')

  call dein#add('lervag/vimtex')
  call dein#add('plasticboy/vim-markdown')

  call dein#add('scrooloose/nerdcommenter') " <leader>cc and <leader>cu
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('tpope/vim-endwise')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('godlygeek/tabular')

  call dein#add('lambdalisue/suda.vim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-surround')

  call dein#add('NLKNguyen/c-syntax.vim')
  call dein#add('vim-scripts/gnuplot-syntax-highlighting')
  call dein#add('numirias/semshi')
  call dein#add('kien/rainbow_parentheses.vim')

  call dein#add('morhetz/gruvbox')
  call dein#add('mhinz/vim-startify')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('norcalli/nvim-colorizer.lua')

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

let g:dein#install_github_api_token = "a65b2635b12baf31eb2ecec8c8a79e2bd9a29347"
command! DeinUp call dein#check_update(v:true)
command! DeinCl call map(dein#check_clean(), "delete(v:val, 'rf')")
