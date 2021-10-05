local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local list = {
    { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
    { key = {"l", "<C-]>"},                 cb = tree_cb("cd") },
    { key = "v",                            cb = tree_cb("vsplit") },
    { key = "s",                            cb = tree_cb("split") },
    { key = "<C-t>",                        cb = tree_cb("tabnew") },
    { key = "<",                            cb = tree_cb("prev_sibling") },
    { key = ">",                            cb = tree_cb("next_sibling") },
    { key = "P",                            cb = tree_cb("parent_node") },
    { key = "<BS>",                         cb = tree_cb("close_node") },
    { key = "<S-CR>",                       cb = tree_cb("close_node") },
    { key = "<Tab>",                        cb = tree_cb("preview") },
    { key = "K",                            cb = tree_cb("first_sibling") },
    { key = "J",                            cb = tree_cb("last_sibling") },
    { key = "I",                            cb = tree_cb("toggle_ignored") },
    { key = ".",                            cb = tree_cb("toggle_dotfiles") },
    { key = "R",                            cb = tree_cb("refresh") },
    { key = "n",                            cb = tree_cb("create") },
    { key = "d",                            cb = tree_cb("remove") },
    { key = "r",                            cb = tree_cb("rename") },
    { key = "<C-r>",                        cb = tree_cb("full_rename") },
    { key = "x",                            cb = tree_cb("cut") },
    { key = "c",                            cb = tree_cb("copy") },
    { key = "p",                            cb = tree_cb("paste") },
    { key = "yn",                           cb = tree_cb("copy_name") },
    { key = "yp",                           cb = tree_cb("copy_path") },
    { key = "yy",                           cb = tree_cb("copy_absolute_path") },
    { key = "[c",                           cb = tree_cb("prev_git_item") },
    { key = "]c",                           cb = tree_cb("next_git_item") },
    { key = "h",                            cb = tree_cb("dir_up") },
    { key = "q",                            cb = tree_cb("close") },
    { key = "g?",                           cb = tree_cb("toggle_help") },
}

require'nvim-tree'.setup {
      disable_netrw       = true,
      hijack_netrw        = true,
      open_on_setup       = false,
      ignore_ft_on_setup  = {},
      auto_close          = false,
      open_on_tab         = false,
      hijack_cursor       = false,
      update_cwd          = false,
      lsp_diagnostics     = false,
      update_focused_file = {
        enable      = false,
        update_cwd  = false,
        ignore_list = {}
      },
      system_open = {
        cmd  = nil,
        args = {}
      },
      view = {
        width = 30,
        side = 'left',
        auto_resize = false,
        mappings = {
          custom_only = false,
          list = list
        }
      }
}

vim.api.nvim_set_keymap(
    'n',
    '<Leader>ut',
    '<cmd>lua require"nvim-tree".toggle()<CR>',
    {noremap=true, silent=true}
)
