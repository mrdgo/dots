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
	},
})

vim.cmd([[
augroup FormatGroup
	autocmd!
	autocmd BufWritePost *.java,*.ts,*.lua,*.py FormatWrite
	"autocmd User FormatterPost print "Formatter Post"
	"autocmd WinEnter * print "Win Enter"
	"autocmd TextChanged * print "Text Changed"
	autocmd FocusGained * TSDisable rainbow | TSEnable rainbow
augroup end
]])

-- local au_id = vim.api.nvim_create_augroup("format", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
-- 	pattern = "",
-- 	callback = function()
-- 		vim.cmd([[FormatWrite]])
-- 	end,
-- 	group = au_id,
-- })
--
-- vim.api.nvim_create_autocmd({ "User FormatterPost" }, {
-- 	pattern = "*.java, *.ts, *.lua, *.py ",
-- 	callback = function()
-- 		vim.cmd([[TSDisable rainbow | TSEnable rainbow]])
-- 	end,
-- 	group = au_id,
-- })
