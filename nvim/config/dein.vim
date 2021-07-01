set runtimepath+=/opt/dots/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/opt/dots/nvim/dein')
  call dein#begin('/opt/dots/nvim/dein')

  call dein#add('/opt/dots/nvim/dein/repos/github.com/Shougo/dein.vim')

  " vimL config chapter

  call dein#add('Shougo/defx.nvim')  " file explorer


  " Marukups
  call dein#add('lervag/vimtex') " ok
  call dein#add('plasticboy/vim-markdown') " ok
  call dein#add('cespare/vim-toml') " ok
  call dein#add('godlygeek/tabular') " ok

  " Code
  call dein#add('scrooloose/nerdcommenter') " <leader>cc and <leader>cu
  call dein#add('kkoomen/vim-doge', { 'hook_post_update': "call doge#install()" })  " ok

  " TODO
  " https://github.com/kyazdani42/nvim-tree.lua
  call dein#add('easymotion/vim-easymotion')
  " python
  call dein#add('numirias/semshi')

  " theme
  call dein#add('morhetz/gruvbox')
  call dein#add('mhinz/vim-startify')

  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  " TODO END

  " ok
  call dein#add('glacambre/firenvim', { 'hook_post_update': "call firenvim#install(0)" })

  " Lua config chapter

  " completion
  call dein#add('nvim-lua/completion-nvim') " ok
  call dein#add('norcalli/snippets.nvim') " ok

  " language server
  call dein#add('neovim/nvim-lspconfig')  " ok
  call dein#add('onsails/lspkind-nvim')  " ok

  call dein#add('nvim-treesitter/nvim-treesitter')  " ok
  call dein#add('p00f/nvim-ts-rainbow')  " ok
  "call dein#add('akinsho/flutter-tools.nvim')

  " Debugging
  call dein#add('mfussenegger/nvim-dap')  " ok
  call dein#add("rcarriga/nvim-dap-ui")  " ok

  " telescope related
  call dein#add('nvim-lua/popup.nvim')  " ok
  call dein#add('nvim-lua/plenary.nvim')  " ok
  call dein#add('nvim-telescope/telescope.nvim')  " ok
  call dein#add('nvim-telescope/telescope-dap.nvim')  " ok
  call dein#add('nvim-telescope/telescope-fzy-native.nvim')  " ok
  call dein#add('nvim-telescope/telescope-media-files.nvim')  " ok
  call dein#add('sudormrfbin/cheatsheet.nvim')  " ok

  "call dein#add('jmcantrell/vim-virtualenv')

  call dein#add('norcalli/nvim-colorizer.lua')  " ok

  " no config plugins
  call dein#add('jiangmiao/auto-pairs')  " ok
  call dein#add('tpope/vim-endwise')  " ok
  call dein#add('tpope/vim-repeat')  " ok
  call dein#add('tpope/vim-surround')  " ok

  " Unix
  call dein#add('tpope/vim-fugitive')  " ok

  " TODO (maxim): https://github.com/glepnir/galaxyline.nvim
  " TODO (maxim): https://github.com/karb94/neoscroll.nvim

  call dein#add('NLKNguyen/c-syntax.vim') " ok
  call dein#add('vim-scripts/gnuplot-syntax-highlighting') " ok

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

let g:dein#install_github_api_token = readfile('/opt/dots/nvim/.git_token')[0]

command! DeinUp call dein#check_update(v:true)
command! DeinCl call map(dein#check_clean(), "delete(v:val, 'rf')")
