# Nushell Environment Config File

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
$env.NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
$env.NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# $env.PATH = ($env.PATH | split row (char esep) | prepend '/some/path')

$env.PROMPT_INDICATOR = {|| "" }
$env.PROMPT_INDICATOR_VI_INSERT = {|| "" }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| "" }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::: " }

$env.TERM = "xterm-256color"
$env.BROWSER = "firefox"
$env.PAGER = "nvimpager"
$env.BAT_THEME = "gruvbox-dark"
$env.EDITOR = "nvim"
$env.TERMINAL = "wezterm"
$env.LANG = "en_US.UTF-8"
$env._JAVA_AWT_WM_NONREPARENTING = 1
$env.PF_SOURCE = /home/maxim/dokumente/proj/pfetch/addon.sh

let paths = (cat ~/.bin_dirs | lines | each {|| prepend "/home/maxim/" | str join })

$env.PATH =  ($env.PATH | split row (char esep) | append $paths | str join ':')
$env.NEOVIDE_MULTIGRID = true
