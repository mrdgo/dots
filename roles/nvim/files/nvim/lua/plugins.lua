local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	execute("packadd packer.nvim")
end

local opts = { noremap = true, silent = false }
local pmap = function(key, cmd)
	vim.api.nvim_set_keymap("n", "<Leader>p" .. key, "<cmd>Packer" .. cmd .. "<CR>", opts)
end

pmap("u", "Update")
pmap("s", "Sync")
pmap("i", "Install")
pmap("c", "Clean")

-- TypeScript
-- https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils
-- https://github.com/jose-elias-alvarez/null-ls.nvim

return require("packer").startup(function(use)
	-- Packer can manage itself
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
			require("terminal").setup()
			require("telescope_setup")
			require("telescope_hydra")
		end,
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzy-native.nvim" },
			{ "nvim-telescope/telescope-media-files.nvim" },
			{ "nvim-telescope/telescope-packer.nvim" },
			{ "nvim-telescope/telescope-project.nvim" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "norcalli/nvim-terminal.lua" },
			{ "camgraff/telescope-tmux.nvim" },
			{ "sudormrfbin/cheatsheet.nvim" },
			{ "anuvyklack/hydra.nvim" },
			-- "anuvyklack/keymap-layer.nvim",
		},
	})

	use({
		"ms-jpq/chadtree",
		branch = "chad",
		run = function()
			vim.cmd("CHADdeps")
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
			-- require("dapui_setup")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("treesitter_setup")
		end,
		requires = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{ "p00f/nvim-ts-rainbow" },
		},
	})

	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("autopairs_setup")
			require("coq")
			require("coq_3p")({
				{ src = "nvimlua", short_name = "nLUA" },
				{ src = "dap" },
			})
			require("lsp_setup")
			vim.cmd("COQnow")
			require("lspkind_setup")
			require("lsp_signature").setup({ toggle_key = "<C-l>" })
		end,
		requires = {
			{ "mfussenegger/nvim-jdtls" },
			{ "ms-jpq/coq_nvim", { branch = "coq" } },
			{ "ms-jpq/coq.artifacts", { branch = "artifacts" } },
			{ "windwp/nvim-autopairs" },
			{ "ms-jpq/coq.thirdparty", { branch = "3p" } },
			{ "folke/trouble.nvim" },
			{ "onsails/lspkind-nvim" },
			{ "kyazdani42/nvim-web-devicons" },
			{ "ray-x/lsp_signature.nvim" },
			{ "folke/lsp-colors.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
	})

	--use 'jubnzv/virtual-types.nvim'

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
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
			vim.keymap.set("n", "<Leader>o", require("harpoon.ui").toggle_quick_menu)
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
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
		"kkoomen/vim-doge",
		ft = { "python" },
		config = function()
			vim.cmd("source $HOME/.config/nvim/config/doge.vim")
		end,
		run = function()
			vim.fn["doge#install"]()
		end,
	})

	use({
		--'morhetz/gruvbox'
		"npxbr/gruvbox.nvim",
		config = function()
			vim.g.gruvbox_italic = 1
			vim.g.gruvbox_contrast_dark = "hard"
			vim.g.gruvbox_contrast_light = "soft"
			vim.g.gruvbox_termcolors = 256
			vim.g.gruvbox_hls_cursor = "green"
			vim.g.tokyonight_style = "night"
			vim.cmd("source $HOME/.config/nvim/config/theme.vim")
		end,
		requires = {
			{ "rktjmp/lush.nvim" },
			{ "folke/tokyonight.nvim" },
		},
	})

	use({
		"vimpostor/vim-tpipeline",
		config = function()
			vim.g.tpipeline_autoembed = 0
		end,
	})

	use("tpope/vim-endwise")
	use("tpope/vim-repeat")
	use("tpope/vim-surround")

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

	use({ "NLKNguyen/c-syntax.vim", ft = { "c", "cpp" } })
	use({ "vim-scripts/gnuplot-syntax-highlighting", ft = { "gnuplot" } })

	-- use({
	-- 	"lewis6991/spellsitter.nvim",
	-- 	ft = { "tex" },
	-- 	config = function()
	-- 		require("spellsitter").setup()
	-- 	end,
	-- })

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
end)
