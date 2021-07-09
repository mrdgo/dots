local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

local opts = { noremap=true, silent=false }
local pmap = function(key, cmd)
    vim.api.nvim_set_keymap(
      'n', '<Leader>p'..key,
      '<cmd>Packer'..cmd..'<CR>', opts
    )
end

pmap('u', 'Update')
pmap('s', 'Sync')
pmap('i', 'Install')
pmap('c', 'Clean')

    -- use 'karb94/neoscroll.nvim'

    --use {
    --    'glepnir/galaxyline.nvim',
    --    requires = {{'kyazdani42/nvim-web-devicons'}},
    --    config = function() require'myline' end
    --}

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        config = function() require'telescope_setup' end,
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzy-native.nvim'},
            {'nvim-telescope/telescope-media-files.nvim'},
            {'sudormrfbin/cheatsheet.nvim'}
        }
    }

    use {
        'kyazdani42/nvim-tree.lua',
        config = function() require'nvim-tree_setup' end
    }

    use {
        'rcarriga/nvim-dap-ui',
        requires = {
            {'mfussenegger/nvim-dap'},
            {'nvim-telescope/telescope-dap.nvim'}
        },
        ft = {'python'},
        config = function()
            require'dap_setup'
            require'dapui_setup'
            require'dap_python'
        end
    }


    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require'treesitter_setup' end
    }

    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        requires = {{'nvim-treesitter/nvim-treesitter'}}
    }

    use {
        'p00f/nvim-ts-rainbow',
        requires = {{'nvim-treesitter/nvim-treesitter'}}
    }

    use {
        'neovim/nvim-lspconfig',
        config = function() require'lsp_setup' end

    }

    use {
        'onsails/lspkind-nvim',
        requires = {{'kyazdani42/nvim-web-devicons'}},
        config = function() require'lspkind_setup' end
    }

    --use 'jubnzv/virtual-types.nvim'
    use 'ray-x/lsp_signature.nvim'
    use 'folke/lsp-colors.nvim'
    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require'colorizer'.setup() end
    }

    use {
        'vim-airline/vim-airline-themes',
        requires = {{'vim-airline/vim-airline'}},
        config = function() vim.cmd'source $HOME/.config/nvim/config/airline.vim' end
    }

    use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
    }

    use {
        'nvim-lua/completion-nvim',
        config = function() require'completion_setup' end
    }
    use {
        'norcalli/snippets.nvim',
        config = function() require'snippet_setup' end
    }

    use {
        'kkoomen/vim-doge',
        ft = {'python'},
        config = function() vim.cmd'source $HOME/.config/nvim/config/doge.vim' end,
        run = function() vim.fn['doge#install']() end
    }

    use {
       --'morhetz/gruvbox'
       'npxbr/gruvbox.nvim',
       requires = {{'rktjmp/lush.nvim'}}
    }


    use {
        'jiangmiao/auto-pairs',
        config = function() require'auto_pairs_setup' end
    }

    use 'tpope/vim-endwise'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'

    use {
        'NLKNguyen/c-syntax.vim',
        ft = {'c', 'cpp'}
    }

    use {
        'vim-scripts/gnuplot-syntax-highlighting',
        ft = {'gnuplot'}
    }

    use {
        'lervag/vimtex',
        ft = {'tex', 'bib'}
    }

    use {
        'plasticboy/vim-markdown',
        config = function() vim.cmd'source $HOME/.config/nvim/config/markdown.vim' end,
        ft = {'markdown'}
    }

    use {
        'cespare/vim-toml',
        ft = {'toml'}
    }

    use 'godlygeek/tabular'

    use {
        'easymotion/vim-easymotion',
        config = 'vim.cmd[[source $HOME/.config/nvim/config/easymotion.vim]]'
    }

    use {
        'mhinz/vim-startify',
        config = 'vim.cmd[[source $HOME/.config/nvim/config/startify.vim]]'
    }

    use {
        'scrooloose/nerdcommenter',
        config = function() vim.cmd'source $HOME/.config/nvim/config/commenter.vim' end
    }
end)
