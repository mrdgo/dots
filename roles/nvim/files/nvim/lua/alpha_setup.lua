local max_width = 70

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

local function line_to_words(line)
    local words = {}
    local target = "%S+"
    for word in line:gmatch(target) do
        table.insert(words, word)
    end
    return words
end

local function right_justify_last_line(formatted_line)
  for i, val in ipairs(formatted_line) do
    if val:sub(1,3) == " --" then
      local space = string.rep(" ", max_width - #val - 2)
      formatted_line[i] = space .. val:sub(2,-1)
    end
  end
end

local function is_line_insufficient(buffer, word)
  return (#buffer + #word) > max_width
end

local function is_author(word)
  return word:sub(1,2) == "--"
end

local function is_newline(buffer, word)
  return is_author(word) or is_line_insufficient(buffer, word)
end

--- @param line string
--- @return table
local format_line = function(line)
  local formatted_line = {}
  local words = line_to_words(line)

  local buffer = ""
  for _, word in ipairs(words) do
    if (is_newline(buffer, word)) then
      table.insert(formatted_line, buffer:sub(1,-2))
      buffer = " " .. word .. " "
    else
      buffer = buffer .. word .. " "
    end
  end
  table.insert(formatted_line, buffer:sub(1,-2))
  right_justify_last_line(formatted_line)
  return formatted_line
end

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
      val = format_line(os.capture("motivate --no-colors")),
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
