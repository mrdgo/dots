local splits = require("smart-splits")
local Hydra = require("hydra")

local function cmd(command)
	return table.concat({ "<Cmd>", command, "<CR>" })
end

Hydra({
	name = "Side scroll",
	mode = "n",
	body = "z",
	heads = {
		{ "h", "5zh" },
		{ "l", "5zl", { desc = "←/→" } },
		{ "H", "zH" },
		{ "L", "zL", { desc = "half screen ←/→" } },
	},
})

-- Hydra({
-- 	name = "Debug mode",
-- 	mode = "n",
-- 	hint = "resize mode",
-- 	config = {
-- 		color = "teal",
-- 		invoke_on_body = true,
-- 		hint = {
-- 			-- position = "upp",
-- 			border = "rounded",
-- 		},
-- 	},
-- 	body = "",
-- 	heads = {
-- 		{ "+", "C-w +" },
-- 		{ "-", "C-w -" },
-- 	},
-- })

local buffer_hydra = Hydra({
	name = "Buffer",
	config = {
		timeout = 2000,
	},
	heads = {
		{ "h", cmd("BufferPrevious") },
		{ "l", cmd("BufferNext"), { desc = "choose" } },

		-- Execute an async functions synchronously to preserve the animation.
		{
			"H",
			function()
				vim.cmd("BufferMovePrevious")
				vim.wait(200, function()
					vim.cmd("redraw")
				end, 30, false)
			end,
		},
		{
			"L",
			function()
				vim.cmd("BufferMoveNext")
				vim.wait(200, function()
					vim.cmd("redraw")
				end, 30, false)
			end,
			{ desc = "move" },
		},
		{
			"c",
			function()
				vim.cmd("BufferClose")
				vim.wait(150, function()
					vim.cmd("redraw")
				end, 30, false)
			end,
			{ desc = "close" },
		},

		{ "b", cmd("BufExplorer"), { exit = true, desc = "Explorer" } },
		{ "od", cmd("BufferOrderByDirectory"), { desc = "by directory" } },
		{ "ol", cmd("BufferOrderByLanguage"), { desc = "by language" } },
		{ "<Esc>", nil, { exit = true } },
	},
})

local function choose_buffer()
	if #vim.fn.getbufinfo({ buflisted = true }) > 1 then
		buffer_hydra:activate()
	end
end

-- keymap.set(n, "gb", choose_buffer)

Hydra({
	name = "WINDOWS",
	hint = [[
 ^^^^^^     Move     ^^^^^^   ^^    Size   ^^   ^^     Split
 ^^^^^^--------------^^^^^^   ^^-----------^^   ^^---------------
 ^ ^ _k_ ^ ^   ^ ^ _K_ ^ ^    ^   _<C-k>_   ^   _s_: horizontally
 _h_ ^ ^ _l_   _H_ ^ ^ _L_    _<C-h>_ _<C-l>_   _v_: vertically
 ^ ^ _j_ ^ ^   ^ ^ _J_ ^ ^    ^   _<C-j>_   ^   _q_: close
 focus^^^^^^   window^^^^^^   ^ _=_ equalize^   _b_: choose buffer
]],
	config = {
		timeout = 4000,
		hint = {
			border = "rounded",
			position = "middle",
		},
	},
	mode = "n",
	body = "<C-w>",
	heads = {
		{ "h", "<C-w>h" },
		{ "j", "<C-w>j" },
		{ "k", cmd([[try | wincmd k | catch /^Vim\%((\a\+)\)\=:E11:/ | close | endtry]]) },
		{ "l", "<C-w>l" },

		{ "H", cmd("WinShift left") },
		{ "J", cmd("WinShift down") },
		{ "K", cmd("WinShift up") },
		{ "L", cmd("WinShift right") },

		{
			"<C-h>",
			function()
				splits.resize_left(2)
			end,
		},
		{
			"<C-j>",
			function()
				splits.resize_down(2)
			end,
		},
		{
			"<C-k>",
			function()
				splits.resize_up(2)
			end,
		},
		{
			"<C-l>",
			function()
				splits.resize_right(2)
			end,
		},
		{ "=", "<C-w>=", { desc = "equalize" } },

		{ "s", "<C-w>s" },
		{ "v", "<C-w>v" },
		{ "b", choose_buffer, { exit = true, desc = "choose buffer" } },
		{ "q", cmd([[try | close | catch /^Vim\%((\a\+)\)\=:E444:/ | endtry]]) },
		{ "<Esc>", nil, { exit = true, desc = false } },
	},
})
