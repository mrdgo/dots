
require('dapui').setup({
  layouts = {
    {
      elements = {
        'scopes',
        'breakpoints',
        'stacks',
        'watches',
      },
      size = 40,
      position = 'left',
    },
    {
      elements = {
        'repl',
        'console',
      },
      size = 10,
      position = 'bottom',
    },
  },
  icons = {
    expanded = "⯆",
    collapsed = "⯈"
  },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = {"<CR>"},
    open = "o",
    remove = "d",
    edit = "e",
  },
  sidebar = {
    elements = {
      -- You can change the order of elements in the sidebar
      "scopes",
      "breakpoints",
      "stacks",
      "watches"
    },
    position = "left" -- Can be "left" or "right"
  },
  tray = {
    elements = {
      "repl"
    },
    position = "bottom" -- Can be "bottom" or "top"
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil   -- Floats will be treated as percentage of your screen.
  }
})

local opts = { noremap=false, silent=true }
local map_dapui = function (mode, key, command)
   vim.api.nvim_buf_set_keymap(
       0, mode, '<Leader>e'..key,
       '<cmd>lua require"dapui".'..command..'<CR>',
       opts
   )
end

map_dapui('n', 'u', 'toggle()')
map_dapui('v', 'e', 'eval()')
