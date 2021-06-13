version = '0.14.1'

package.path = os.getenv("HOME") .. '/.config/xplr/lua/?.lua'

-- Press `:p` to toggle preview mode.
--
require'nnn_preview_wrapper'.setup{
  plugin_path = "/home/maxim/.config/nnn/plugins/preview-tabbed",
  fifo_path = "/tmp/xplr.fifo",
  mode = "action",
  key = "p",
}
