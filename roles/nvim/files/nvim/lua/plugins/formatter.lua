return {
	"mhartington/formatter.nvim",
	ft = { "typescript", "javascript", "java", "lua", "python", "kotlin", "elm", "rust" },
	config = function()
		require("formatter").setup({
			filetype = {
				rust = {
					function()
						return { exe = "rustfmt", args = {}, stdin = false }
					end,
				},
				kotlin = {
					function()
						return {
							exe = "ktlint",
							args = { "--format" },
							stdin = false,
						}
					end,
				},
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
				elm = {
					function()
						return {
							exe = "elm-format",
							stdin = false,
						}
					end,
				},
			},
		})

		vim.cmd([[
		augroup FormatGroup
			autocmd!
		augroup end
		]])
		-- 	autocmd BufWritePost *.java,*.ts,*.lua,*.py,*.kt,*.elm,*.rs FormatWrite

		local au_id = vim.api.nvim_create_augroup("format", { clear = true })

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			pattern = "*.java,*.ts,*.lua,*.py,*.kt,*.elm,*.rs",
			group = au_id,
			command = "FormatWrite",
		})

		vim.api.nvim_create_autocmd({ "User" }, {
			pattern = "FormatterPost",
			group = au_id,
			command = [[TSDisable rainbow | TSEnable rainbow]],
		})
	end,
}
