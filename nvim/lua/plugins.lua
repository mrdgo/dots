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

-- https://github.com/folke/trouble.nvim

-- TypeScript
-- https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils
-- https://github.com/jose-elias-alvarez/null-ls.nvim

return require('packer').startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use {
        "nvim-telescope/telescope.nvim",
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
        "kyazdani42/nvim-tree.lua",
        config = function() require'nvim-tree_setup' end
    }

    use {
        "rcarriga/nvim-dap-ui",
        requires = {
            {"mfussenegger/nvim-dap"},
            {"nvim-telescope/telescope-dap.nvim"}
        },
        ft = {"python"},
        config = function()
            require"dap_setup"
            require"dapui_setup"
        end
    }


    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require'treesitter_setup' end
    }

    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        requires = {
            {'p00f/nvim-ts-rainbow'},
            {'nvim-treesitter/nvim-treesitter'}
        }
    }

    use {
        'neovim/nvim-lspconfig',
        config = function() require"lsp_setup" end,
        requires = {{"ms-jpq/coq_nvim"}, {"mfussenegger/nvim-jdtls"}}

    }

    use {
        "onsails/lspkind-nvim",
        requires = {{"kyazdani42/nvim-web-devicons"}},
        config = function() require"lspkind_setup" end
    }

    --use 'jubnzv/virtual-types.nvim'
    use "ray-x/lsp_signature.nvim"
    use "folke/lsp-colors.nvim"
    use {
        "norcalli/nvim-colorizer.lua",
        config = function() require"colorizer".setup() end
    }

    use {
        "ThePrimeagen/refactoring.nvim",
        ft = {"python", "lua", "java", "typescript"},
        config = function() require"refactoring_setup" end,
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-treesitter/nvim-treesitter"}
        }
    }

    use {
        'NTBBloodbath/galaxyline.nvim',
        config = function() require'gruv_line' end
    }

--     use {
--         'windwp/floatline.nvim',
--         config = function() require'floatline'.setup() end
--     }

    use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
    }

    use 'zsugabubus/crazy8.nvim'

    use {
        'ms-jpq/coq_nvim',
        branch = 'coq',
        requires = {
            {'ms-jpq/coq.artifacts', {branch = 'artifacts'}}
            --{ 'codota/tabnine-vim' }
        },
        config = function() vim.g.coq_settings = { auto_start = true, } end
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
       config = function() vim.cmd'source $HOME/.config/nvim/config/theme.vim' end,
       requires = {{'rktjmp/lush.nvim'}}
    }

    --use 'windwp/nvim-autopairs'
    use {
        'jiangmiao/auto-pairs',
        config = function() require'auto_pairs_setup' end
    }

    use 'tpope/vim-endwise'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'

    use {
        'tpope/vim-fugitive',
        config = function() require'fugitive_setup' end
    }

    use { 'NLKNguyen/c-syntax.vim', ft = {'c', 'cpp'} }
    use { 'vim-scripts/gnuplot-syntax-highlighting', ft = {'gnuplot'} }
    use { 'lervag/vimtex', ft = {'tex', 'bib'} }
    -- use { 'cespare/vim-toml', ft = {'toml'} }

    --use {
    --    'plasticboy/vim-markdown',
    --    config = function() vim.cmd'source $HOME/.config/nvim/config/markdown.vim' end,
    --    ft = {'markdown'}
    --}


    use {
        'lewis6991/spellsitter.nvim',
        ft = {'tex'},
        config = function() require'spellsitter'.setup() end
    }

    use 'godlygeek/tabular'

    --use 'ggandor/lightspeed.nvim'

    use {
        'easymotion/vim-easymotion',
        config = function() vim.cmd[[source $HOME/.config/nvim/config/easymotion.vim]] end
    }

    use {
        'mhinz/vim-startify',
        config = function() vim.cmd[[source $HOME/.config/nvim/config/startify.vim]] end
    }

    use {
        "terrortylor/nvim-comment",
        config = function() require"nvim_comment".setup() end
    }

    --use {
    --    'scrooloose/nerdcommenter',
    --    config = function() vim.g.NERDDefaultNesting = 0 end
    --}

    use {
        "nvim-neorg/neorg",
        config = function() require'neorg_setup' end,
        ft = "norg",
        requires = "nvim-lua/plenary.nvim"
    }

end)
