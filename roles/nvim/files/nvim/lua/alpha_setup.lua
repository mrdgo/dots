function os.capture(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  -- s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

local startify = require'alpha.themes.startify'

local function button(sc, txt, keybind, keybind_opts)
    local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

    local opts = {
        position = "center",
        shortcut = sc,
        cursor = 5,
        width = 50,
        align_shortcut = "right",
        hl_shortcut = "Keyword",
    }
    if keybind then
        keybind_opts = vim.F.if_nil(keybind_opts, {noremap = true, silent = true, nowait = true})
        opts.keymap = {"n", sc_, keybind, keybind_opts}
    end

    local function on_press()
        local key = vim.api.nvim_replace_termcodes(sc_ .. '<Ignore>', true, false, true)
        vim.api.nvim_feedkeys(key, "normal", false)
    end

    return {
        type = "button",
        val = txt,
        on_press = on_press,
        opts = opts,
    }
end

math.randomseed(os.time())
local index = math.floor(math.random() * 6 + 1)
local header_text_now = require'banners'[index]

startify.section.bottom_buttons.val = {
    startify.button( "q", "  Quit NVIM" , ":qa<CR>"),
}

-- require"alpha".setup(startify.opts)
require"alpha".setup {
  layout = {
    {
      type = "text",
      val = header_text_now,
      opts = {
        position = "center",
        hl = "Type",
        shrink_margin = false,
        wrap = "overflow"
      }
    },
    { type = "padding", val = 1 },
    button("SPC u p", "  Search sessions"),
    button("SPC p u", "  Update plugins" ),
    button("SPC p s", "  Sync plugins"   ),
    { type = "padding", val = 1 },
    button("SPC q w", "  Close window"   ),
    button("SPC q q", "  Close nvim"   ),
    { type = "padding", val = 3 },
    {
      type = "text",
      val = os.capture("motivate --no-colors"),
      opts = {
          position = "center",
          wrap = "overflow",
          hl = "NvimString",
        }
    },
  },
  opts = {
    margin = 5
  }
}
