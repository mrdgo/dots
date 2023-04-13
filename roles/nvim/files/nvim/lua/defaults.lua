vim.o.hidden = true

vim.o.showcmd = true
vim.o.wildmenu = true
vim.o.lazyredraw = false

vim.o.cursorline = true
vim.o.cursorcolumn = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- vim.opt.hlsearch = false
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.smartcase = true

vim.o.display = "lastline"
vim.o.termguicolors = true
vim.o.laststatus = 3
vim.o.cmdheight = 0
vim.o.splitkeep = "screen"
vim.o.colorcolumn = "80"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.number = true
vim.o.relativenumber = true

vim.o.linebreak = true
vim.o.breakindent = true
vim.o.showbreak = "> "

vim.o.scrolloff = 5

vim.o.foldenable = false
vim.o.foldmethod = "manual"
-- vim.o.foldmethod = "expr"
vim.o.foldnestmax = 3
vim.o.foldminlines = 1

vim.o.clipboard = "unnamedplus"

-- -- solid underscore
-- vim.cmd[[let &t_SI .= "\<Esc>[4 q"]]
-- -- solid block
-- vim.cmd[[let &t_EI .= "\<Esc>[2 q"]]

-- vim.cmd[[filetype plugin indent on]]
-- vim.cmd[[syntax enable]]

-- vim.cmd[[hi CursorLine cterm=NONE ctermbg=8 ctermfg=NONE]]
-- vim.cmd[[hi Cursorline term=NONE cterm=NONE]]
-- vim.cmd[[hi LineNr ctermfg=grey]]
