local function prettier()
	return {
		exe = "npx",
		args = {
			"prettier",
			"--stdin-filepath",
			vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
			"--single-quote",
		},
		stdin = true,
	}
end

require("formatter").setup({
	filetype = {
		typescript = { prettier },
		javascript = { prettier },
		html = { prettier },
		lua = {
			function()
				return {
					exe = "stylua",
					args = { "-" },
					stdin = true,
				}
			end,
		},
		java = {
			function()
				return {
					exe = "google-java-format",
					args = {
						"--aosp",
						"--replace",
						"--skip-sorting-imports",
						"--skip-reflowing-long-strings",
						vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
					},
					stdin = false,
				}
			end,
		},
		python = {
			function()
				return {
					exe = "black",
					args = {
						"-",
						-- vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
					},
					stdin = true,
				}
			end,
		},
		clojure = {
			function()
				return {
					exe = "cljstyle",
					args = {
						"fix",
					},
					stdin = false,
				}
			end,
		},
	},
})

vim.api.nvim_set_keymap("n", "<Leader>ff", "<cmd>Format<CR>", { noremap = true })

vim.cmd([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.java,*.ts,*.lua,*.py FormatWrite
  autocmd BufWritePost *.ts EslintFixAll
augroup END
]])