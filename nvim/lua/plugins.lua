
--/usr/share/nvim/site/pack/packer/start/packer.nvim

require'packer'.startup(function()
  -- TODO (maxim): https://github.com/glepnir/galaxyline.nvim
  -- TODO (maxim): https://github.com/karb94/neoscroll.nvim

  use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-dap.nvim'},
            {'nvim-telescope/telescope-fzy-native.nvim'},
            {'nvim-telescope/telescope-media-files.nvim'},
            {'sudormrfbin/cheatsheet.nvim'}
        },
        config = function() require'telescope_setup' end
    }

    use {
        'numirias/semshi',
        config = function() vim.cmd('source $HOME/.config/nvim/config/semshi.vim') end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {{'p00f/nvim-ts-rainbow'}},
        config = function() require'treesitter_setup' end
    }

    use {
        'neovim/nvim-lspconfig',
        requires = {{'onsails/lspkind-nvim'}},
        -- keep an eye on {'jubnzv/virtual-types.nvim'}
        config = function()
            require'lsp_setup'
            require'lspkind_setup'
        end
    }

    use {
        'rcarriga/nvim-dap-ui',
        requires = {'mfussenegger/nvim-dap'},
        config = function()
            require'dap_setup'
            require'dap_python'
            require'dapui_setup'
        end
    }

    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require'colorizer'.setup() end
    }

    use {
        'nvim-lua/completion-nvim',
        requires = {'norcalli/snippets.nvim'},
        config = function()
            require'snippet_setup'
            require'completion_setup'
        end
    }

    use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
    }

    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
         config = function() require'spaceline' end,
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    use {
        'kkoomen/vim-doge',
        run = function() vim.fn["doge#install"]() end,
        config = function() vim.cmd('source $HOME/.config/nvim/config/doge.vim') end
    }

    -- Utility
    use {
        'jiangmiao/auto-pairs',
        config = function() require'auto_pairs_setup' end
    }
    use 'tpope/vim-endwise'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use 'NLKNguyen/c-syntax.vim'
    use 'vim-scripts/gnuplot-syntax-highlighting'

    -- Marukups
    use 'lervag/vimtex'

    use {
        'plasticboy/vim-markdown',
        config = function() vim.cmd('source $HOME/.config/nvim/config/markdown.vim') end
    }

    use 'cespare/vim-toml'
    use 'godlygeek/tabular'

    --use {
    --    'morhetz/gruvbox',
    --}
    use {
        "npxbr/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"},
        config = function() vim.cmd('source $HOME/.config/nvim/config/theme.vim') end
    }
    use {
        'easymotion/vim-easymotion',
        config = function() vim.cmd('source $HOME/.config/nvim/config/easymotion.vim') end
    }

    use {
        'mhinz/vim-startify',
        config = function() vim.cmd('source $HOME/.config/nvim/config/startify.vim') end
    }

    --use {
    --    'vim-airline/vim-airline',
    --    requires = {'vim-airline/vim-airline-themes'},
    --    config = function() vim.cmd('source $HOME/.config/nvim/config/airline.vim') end
    --}

    use {
        'scrooloose/nerdcommenter' ,
        config = function() vim.cmd('source $HOME/.config/nvim/config/commenter.vim') end
    }

end)
