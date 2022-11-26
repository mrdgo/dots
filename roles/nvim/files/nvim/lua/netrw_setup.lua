vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_winsize = 20
vim.g.netrw_liststyle = 3
vim.g.netrw_altv = 1

require("netrw").setup({
	-- Define normal mode mapping
	-- icons = {
	-- 	symlink = "", -- Symlink icon (directory and file)
	-- 	directory = "", -- Directory icon
	-- 	file = "", -- File icon
	-- },
	use_devicons = true,
	mappings = {
		["p"] = function(payload)
			-- Payload is an object describing the node under the cursor, the object
			-- has the following keys:
			-- - dir: the current netrw directory (vim.b.netrw_curdir)
			-- - node: the name of the file or directory under the cursor
			-- - link: the referenced file if the node under the cursor is a symlink
			-- - extension: the file extension if the node under the cursor is a file
			-- - type: the type of node under the cursor (0 = dir, 1 = file, 2 = symlink)
			print(vim.inspect(payload))
		end,
	},
})

vim.keymap.set("n", "<Leader>ut", "<cmd>Lex<CR>", {})
