set runtimepath+=/opt/dots/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/opt/dots/nvim/dein')
  call dein#begin('/opt/dots/nvim/dein')

  call dein#add('/opt/dots/nvim/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/defx.nvim')  " file explorer
  call dein#add('Shougo/deol.nvim')  " terminal utilities
  call dein#add('Shougo/denite.nvim')  " terminal utilities

  " completion
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('deoplete-plugins/deoplete-zsh')

  " language server
  call dein#add('neovim/nvim-lspconfig')
  call dein#add('Shougo/deoplete-lsp')
  call dein#add('akinsho/flutter-tools.nvim')

  " Debugging
  call dein#add('mfussenegger/nvim-dap')

  " telescope related
  call dein#add('nvim-lua/popup.nvim')
  call dein#add('nvim-lua/plenary.nvim')
  call dein#add('nvim-telescope/telescope.nvim')
  call dein#add('nvim-telescope/telescope-dap.nvim')
  call dein#add('nvim-telescope/telescope-fzy-native.nvim')

  " Marukups
  call dein#add('lervag/vimtex')
  call dein#add('plasticboy/vim-markdown')

  call dein#add('scrooloose/nerdcommenter') " <leader>cc and <leader>cu
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('tpope/vim-endwise')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('tpope/vim-repeat')
  call dein#add('godlygeek/tabular')

  call dein#add('lambdalisue/suda.vim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-surround')
  call dein#add('AndrewRadev/deleft.vim')  " dh removes if else logic
  call dein#add('kkoomen/vim-doge', { 'hook_post_update': "call doge#install()" })  " automatically add docstrings

  call dein#add('NLKNguyen/c-syntax.vim')
  call dein#add('vim-scripts/gnuplot-syntax-highlighting')

  call dein#add('numirias/semshi')
  call dein#add('kien/rainbow_parentheses.vim')

  " theme
  call dein#add('morhetz/gruvbox')
  call dein#add('mhinz/vim-startify')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('norcalli/nvim-colorizer.lua')

  call dein#add('glacambre/firenvim', { 'hook_post_update': "call firenvim#install(0)" })

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

let g:dein#install_github_api_token = readfile('/opt/dots/nvim/.git_token')[0]

command! DeinUp call dein#check_update(v:true)
command! DeinCl call map(dein#check_clean(), "delete(v:val, 'rf')")
