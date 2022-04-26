local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
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

-- https://github.com/folke/trouble.nvim

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
			-- require("session_setup")
			require("git_wt_setup")
		end,
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzy-native.nvim" },
			{ "nvim-telescope/telescope-media-files.nvim" },
			{ "nvim-telescope/telescope-packer.nvim" },
			{ "nvim-telescope/telescope-project.nvim" },
			-- { "rmagatti/session-lens" },
			-- { "rmagatti/auto-session" },
			{ "norcalli/nvim-terminal.lua" },
			{ "camgraff/telescope-tmux.nvim" },
			{ "sudormrfbin/cheatsheet.nvim" },
			{ "ThePrimeagen/git-worktree.nvim" },
			-- {"tami5/sqlite.lua"},
			-- {"nvim-telescope/telescope-smart-history.nvim"},
		},
	})

	-- use({
	-- 	"ms-jpq/chadtree",
	-- 	branch = "chad",
	-- 	run = function()
	-- 		vim.cmd("CHADdeps")
	-- 	end,
	-- 	config = function()
	-- 		require("chadtree_setup")
	-- 	end,
	-- })

	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("nvim-tree_setup")
		end,
	})

	use({
		"mfussenegger/nvim-dap",
		requires = {
			{ "rcarriga/nvim-dap-ui" },
			{ "nvim-telescope/telescope-dap.nvim" },
		},
		ft = { "python", "java" },
		config = function()
			require("dap_setup")
			require("dapui_setup")
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
				-- { src = "dap" },
			})
			require("lsp_setup")
			vim.cmd("COQnow")
		end,
		requires = {
			{ "mfussenegger/nvim-jdtls" },
			{ "ms-jpq/coq_nvim", { branch = "coq" } },
			{ "ms-jpq/coq.artifacts", { branch = "artifacts" } },
			{ "windwp/nvim-autopairs" },
			{ "ms-jpq/coq.thirdparty", { branch = "3p" } },
		},
	})

	use({
		"onsails/lspkind-nvim",
		requires = { { "kyazdani42/nvim-web-devicons" } },
		config = function()
			require("lspkind_setup")
		end,
	})

	--use 'jubnzv/virtual-types.nvim'

	use({
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup({ toggle_key = "<C-l>" })
		end,
	})

	use("folke/lsp-colors.nvim")
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

	-- use({
	-- 	"folke/todo-comments.nvim",
	-- 	requires = "nvim-lua/plenary.nvim",
	-- 	config = function()
	-- 		require("todo-comments").setup({})
	-- 	end,
	-- })

	use({
		"ThePrimeagen/harpoon",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			local function nmap(keys, cmd)
				vim.api.nvim_set_keymap("n", keys, cmd, { noremap = true, silent = true })
			end
			-- require"harpoon".setup()
			nmap("<Leader><Leader>a", "<cmd>lua require'harpoon.mark'.add_file()<CR>")
			nmap("<Leader><Leader>o", "<cmd>lua require'harpoon.ui'.toggle_quick_menu()<CR>")
		end,
	})

	-- better: https://github.com/nvim-lualine/lualine.nvim
	use({
		"NTBBloodbath/galaxyline.nvim",
		config = function()
			require("gruv_line")
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
		"Olical/conjure",
		ft = { "clojure" },
		config = function()
			vim.api.nvim_set_keymap("n", "<LocalLeader>et", "<cmd>ConjureCljRunCurrentTest<CR>", { noremap = true })
			vim.api.nvim_set_keymap("n", "<LocalLeader>eR", "<cmd>ConjureCljRefreshAll<CR>", { noremap = true })
		end,
	})

	-- use({
	-- 	"jiangmiao/auto-pairs",
	-- 	config = function()
	-- 		require("auto_pairs_setup")
	-- 	end,
	-- })

	use("tpope/vim-endwise")
	use("tpope/vim-repeat")
	use("tpope/vim-surround")

	-- use({
	-- 	"tpope/vim-fugitive",
	-- 	config = function()
	-- 		require("fugitive_setup")
	-- 	end,
	-- })

	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm_setup")
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

	use({ "NLKNguyen/c-syntax.vim", ft = { "c", "cpp" } })
	use({ "vim-scripts/gnuplot-syntax-highlighting", ft = { "gnuplot" } })
	use({ "lervag/vimtex", ft = { "tex", "bib" } })
	-- use { 'cespare/vim-toml', ft = {'toml'} }

	--use {
	--    'plasticboy/vim-markdown',
	--    config = function() vim.cmd'source $HOME/.config/nvim/config/markdown.vim' end,
	--    ft = {'markdown'}
	--}

	use({
		"lewis6991/spellsitter.nvim",
		ft = { "tex" },
		config = function()
			require("spellsitter").setup()
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
end)
