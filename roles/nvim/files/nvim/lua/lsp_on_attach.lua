-- function _G.rename()
-- 	local currName = vim.fn.expand("<cword>")
-- 	local tshl = require("nvim-treesitter-playground.hl-info").get_treesitter_hl()
-- 	if tshl and #tshl > 0 then
-- 		local ind = tshl[#tshl]:match("^.*()%*%*.*%*%*")
-- 		tshl = tshl[#tshl]:sub(ind + 2, -3)
-- 	end
--
-- 	local win = require('plenary.popup').create(currName, {
-- 		title = "New Name",
-- 		style = "minimal",
-- 		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
-- 		relative = "cursor",
-- 		borderhighlight = "FloatBorder",
-- 		titlehighlight = "Title",
-- 		highlight = tshl,
-- 		focusable = true,
-- 		width = 25,
-- 		height = 1,
-- 		line = "cursor+2",
-- 		col = "cursor-1"
-- 	})
--
-- 	local map_opts = { noremap = true, silent = true }
-- 	vim.api.nvim_buf_set_keymap(0, "i", "<Esc>", "<cmd>stopinsert | q!<CR>", map_opts)
-- 	vim.api.nvim_buf_set_keymap(0, "n", "<Esc>", "<cmd>stopinsert | q!<CR>", map_opts)
-- 	vim.api.nvim_buf_set_keymap(0, "i", "<CR>", "<cmd>stopinsert | lua _rename('"..currName.."')<CR>", map_opts)
-- 	vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<cmd>stopinsert | lua _rename('"..currName.."')<CR>", map_opts)
--
-- 	function _G._rename(curr)
-- 		local newName = vim.trim(vim.fn.getline('.'))
-- 		vim.api.nvim_win_close(win, true)
-- 		if #newName > 0 and newName ~= curr then
-- 			local params = vim.lsp.util.make_position_params()
-- 			params.newName = newName
-- 			vim.lsp.buf_request(0, "textDocument/rename", params, function(err, result)
-- 				if err then vim.notify(("Error running lsp query 'rename': "..err), vim.log.levels.ERROR) end
-- 				if result and result.changes then
-- 					put(result)
-- 					local msg = ""
-- 					for f, c in pairs(result.changes) do
-- 						local new = c[1].newText
-- 						msg = msg..("%d changes -> %s"):format(#c, f:gsub("file://",""):gsub(vim.fn.getcwd(),".")).."\n"
-- 						msg = msg:sub(1, #msg - 1)
-- 						vim.notify(msg, vim.log.levels.INFO, { title = ("Rename: %s -> %s"):format(currName, new) })
-- 					end
-- 				end
-- 				vim.lsp.util.apply_workspace_edit(result)
-- 			end)
-- 		end
-- 	end
-- end

return {
  on_attach = function(a, bufnr)

  require'lsp_signature'.on_attach(a, bufnr)
  --require'virtualtypes'.on_attach(a, bufnr)

  local opts = { noremap=false, silent=true }

  local map = function(key, cmd)
    vim.api.nvim_buf_set_keymap(
      bufnr, "n", "<Leader>s"..key,
      "<cmd>lua "..cmd.."<CR>", opts
    )
  end

  local map_lsp = function(key, cmd)
    map(key, "vim.lsp."..cmd)
  end

  map_lsp("k", "buf.hover()")
  map_lsp("D", "buf.declaration()")
  -- map_lsp("d", "buf.definition()")
  -- map_lsp("i", "buf.implementation()")
  map_lsp("S", "buf.signature_help()")
  map_lsp("t", "buf.type_definition()")
  map_lsp("R", "buf.rename()")
  map_lsp("f", "buf.formatting()")
  map_lsp("a", "diagnostic.show_line_diagnostics()")
  map_lsp("n", "diagnostic.goto_next()")
  map_lsp("p", "diagnostic.goto_prev()")

  local map_tel = function(key, cmd)
    map(key, 'require"telescope.builtin".'..cmd)
  end

  map_tel("r", "lsp_references()")
  map_tel("A", "lsp_code_actions()")
  map_tel("g", "lsp_document_diagnostics()")
  map_tel("i", "lsp_implementations()")
  map_tel("d", "lsp_definitions()")
  map_tel("s", "lsp_document_symbols()")

end}
