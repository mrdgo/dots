local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', 'j', 'Lj', opts)
vim.api.nvim_set_keymap('n', 'k', 'Hk', opts)
vim.api.nvim_set_keymap('n', 'q', '<cmd>q<cr>', opts)
