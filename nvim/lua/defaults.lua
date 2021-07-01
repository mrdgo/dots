vim.opt.hidden = true

vim.opt.showcmd = true
vim.opt.wildmenu = true
vim.opt.lazyredraw = false

vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartcase = true

vim.opt.laststatus = 2
vim.opt.colorcolumn = 80
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true

vim.opt.clipboard:append{'unnamedplus'}

-- solid underscore
vim.cmd('let &t_SI .= "\<Esc>[4 q"')
-- solid block
vim.cmd('let &t_EI .= "\<Esc>[2 q"')

vim.cmd('let loadedd_matchparen = 1')

vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')

vim.cmd('hi CursorLine cterm=NONE ctermbg=8 ctermfg=NONE')
vim.cmd('hi Cursorline term=NONE cterm=NONE')
vim.cmd('hi LineNr ctermfg=grey')
