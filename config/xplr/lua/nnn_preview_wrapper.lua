local function setup(o)

  if o.fifo_path == nil then
    o.fifo_path = os.getenv("NNN_FIFO")
  end

  if o.mode == nil then
    o.mode = "action"
  end

  if o.key == nil then
    o.key = "p"
  end

  local enabled = false
  local messages = {}

  os.execute('[ ! -p "' .. o.fifo_path ..'" ] && mkfifo "' .. o.fifo_path .. '"')

  xplr.fn.custom.preview_toggle = function(app)

    if enabled then
      enabled = false
      messages = { "StopFifo" }
    else
      os.execute('NNN_FIFO="' .. o.fifo_path .. '" "'.. o.plugin_path .. '" & ')
      enabled = true
      messages = {
        { StartFifo = o.fifo_path },
        { BashExecSilently = 'echo $XPLR_FOCUS_PATH >> "' .. o.fifo_path .. '" &' },
      }
    end

    return messages
  end

  xplr.config.modes.builtin[o.mode].key_bindings.on_key[o.key] = {
    help = "toggle preview",
    messages = {
      "PopMode",
      { CallLuaSilently = "custom.preview_toggle" },
    },
  }
end

return { setup = setup }
