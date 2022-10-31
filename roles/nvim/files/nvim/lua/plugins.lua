local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	execute("packadd packer.nvim")
end

local packer_maps = {
	{ "u", "Update" },
	{ "s", "Sync" },
	{ "i", "Install" },
	{ "c", "Clean" },
}

for _, cmd in pairs(packer_maps) do
	vim.api.nvim_set_keymap(
		"n",
		"<Leader>p" .. cmd[1],
		"<cmd>Packer" .. cmd[2] .. "<CR>",
		{ noremap = true, silent = false }
	)
end

-- TypeScript
-- https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("alpha_setup")
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("telescope_setup")
			require("telescope_hydra")
			require("noice_setup")
		end,
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-telescope/telescope-media-files.nvim",
			"nvim-telescope/telescope-packer.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"jvgrootveld/telescope-zoxide",
			"camgraff/telescope-tmux.nvim",
			"anuvyklack/hydra.nvim",
			"kazhala/close-buffers.nvim",
			"folke/noice.nvim",
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	})

	use({
		"stevearc/dressing.nvim",
		config = function()
			require("dressing_setup")
		end,
	})

	use({
		"ms-jpq/chadtree",
		branch = "chad",
		run = function()
			vim.cmd("!python -m chadtree deps")
		end,
		config = function()
			require("chadtree_setup")
		end,
	})

	use({
		"mfussenegger/nvim-dap",
		requires = {
			{ "rcarriga/nvim-dap-ui" },
			{ "nvim-telescope/telescope-dap.nvim" },
			{ "anuvyklack/hydra.nvim" },
			-- "anuvyklack/keymap-layer.nvim",
		},
		config = function()
			require("dap_hydra")
			-- require("dap_setup")
			require("dapui_setup")
		end,
	})

	use({
		"0x00-ketsu/maximizer.nvim",
		config = function()
			require("maximizer").setup({})
			vim.api.nvim_set_keymap(
				"n",
				"mt",
				"",
				{ silent = true, noremap = true, callback = require("maximizer").toggle }
			)
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			-- require("ts-fix")
			require("treesitter_setup")
		end,
		requires = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{ "p00f/nvim-ts-rainbow" },
		},
	})

	use({
		"MrcJkb/haskell-tools.nvim",
		requires = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		ft = { "hs" },
		config = function()
			require("hls_setup")
		end,
	})

	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("goto_preview_setup")
			require("autopairs_setup")

			require("lsp_setup")
			-- require("test_setup")
		end,
		requires = {
			{ "mfussenegger/nvim-jdtls" },
			{ "windwp/nvim-autopairs" },
			{ "folke/trouble.nvim" },
			{ "onsails/lspkind-nvim" },
			{ "kyazdani42/nvim-web-devicons" },
			{ "ray-x/lsp_signature.nvim" },
			{ "folke/lsp-colors.nvim" },
			{ "nvim-telescope/telescope.nvim" },
			{ "rmagatti/goto-preview" },
		},
	})

	use({
		"nvim-neotest/neotest",
		config = function()
			require("neotest_setup")
		end,
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-python",
		},
	})

	use({
		"jose-elias-alvarez/typescript.nvim",
		config = function()
			require("typescript").setup({
				disable_commands = true, -- prevent the plugin from creating Vim commands
				debug = false, -- enable debug logging for commands
				server = { -- pass options to lspconfig's setup method
					on_attach = require("typescript_setup").on_attach,
				},
			})
		end,
	})

	--use 'jubnzv/virtual-types.nvim'

	use({
		"uga-rosa/ccc.nvim",
		config = function()
			require("ccc_setup")
		end,
	})

	use({
		-- "mrdgo/refactoring.nvim",
		"ThePrimeagen/refactoring.nvim",
		ft = { "python", "lua", "java", "typescript" },
		config = function()
			require("refactoring_setup")
		end,
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	use({
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	})

	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	})

	use({
		"ThePrimeagen/harpoon",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			vim.keymap.set("n", "<Leader>a", require("harpoon.mark").add_file)
			vim.keymap.set("n", "<Leader>o", require("telescope").extensions.harpoon.marks)
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			{ "kyazdani42/nvim-web-devicons", opt = true },
			"WhoIsSethDaniel/lualine-lsp-progress",
		},
		config = function()
			require("lualine_setup")
		end,
	})

	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	use("zsugabubus/crazy8.nvim")

	use({
		"luisiacc/gruvbox-baby",
		config = function()
			require("theme")
		end,
	})

	use({
		"melkster/modicator.nvim",
		after = "gruvbox-baby", -- Add your colorscheme plugin here
		config = function()
			require("modicator").setup({})
		end,
	})

	use({
		"vimpostor/vim-tpipeline",
		config = function()
			vim.g.tpipeline_autoembed = 0
			vim.g.tpipeline_cursormoved = 1
		end,
	})

	use("seandewar/nvimesweeper")
	use("nagy135/typebreak.nvim")

	use({ "kevinhwang91/nvim-bqf", ft = "qf" })

	-- use({
	-- 	"https://gitlab.com/yorickpeterse/nvim-pqf.git",
	-- 	config = function()
	-- 		require("pqf").setup()
	-- 	end,
	-- })

	use("tpope/vim-endwise")
	use("tpope/vim-repeat")

	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end,
	})

	use({
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup({
				mapping = { "jk" },
				timeout = vim.o.timeoutlen,
				clear_empty_lines = false,
				keys = "<Esc>",
			})
		end,
	})

	use("godlygeek/tabular")

	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	})

	use({
		"phaazon/hop.nvim",
		as = "hop",
		config = function()
			-- vim.cmd([[set virtualedit=onemore]])
			require("hop").setup({
				inclusive_jump = false,
				uppercase_labels = false,
				create_hl_autocmd = true,
			})
			-- Set up `f` as general hop hotkey to hint character
			vim.api.nvim_set_keymap("n", "<Leader>f", "<cmd>HopChar1MW<cr>", {})

			-- Set up actions in normal mode
			-- local actions = { "d", "c", "y", "ys" }
			-- for _, a in ipairs(actions) do
			--     vim.api.nvim_set_keymap("n", a .. "f", a .. "<cmd>lua require'hop'.hint_char1()<cr>", {})
			-- end

			-- vim.cmd[[hi HopUnmatched Comment]]
		end,
	})

	use({
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup()
		end,
	})

	use({
		"sQVe/sort.nvim",
		config = function()
			require("sort").setup({})
		end,
	})

	use({
		"nvim-neorg/neorg",
		config = function()
			require("neorg_setup")
		end,
		ft = "norg",
		requires = "nvim-lua/plenary.nvim",
	})

	use({
		"mhartington/formatter.nvim",
		ft = { "typescript", "javascript", "java", "lua", "python", "clojure" },
		config = function()
			require("formatter_setup")
		end,
	})

	use({
		"LhKipp/nvim-nu",
		requires = "jose-elias-alvarez/null-ls.nvim",
		run = function()
			vim.cmd([[:TSInstall nu]])
		end,
		config = function()
			require("null-ls").setup({})
			require("nu").setup({})
		end,
	})

	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("cmp_setup")
		end,
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "ray-x/cmp-treesitter" },
			{ "L3MON4D3/LuaSnip", tag = "v1.*" },
			{ "saadparwaiz1/cmp_luasnip" },
		},
	})
end)
