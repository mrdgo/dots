# Nushell Environment Config File

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
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
let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | split row (char esep) | prepend '/some/path')

let-env PROMPT_INDICATOR = {|| "" }
let-env PROMPT_INDICATOR_VI_INSERT = {|| "" }
let-env PROMPT_INDICATOR_VI_NORMAL = {|| "" }
let-env PROMPT_MULTILINE_INDICATOR = {|| "::: " }
let-env LD_LIBRARY_PATH = "/usr/lib/nvidia:/home/maxim/.mujoco/mujoco210/bin"


let-env BROWSER = "firefox"
let-env PAGER = "nvimpager"
let-env BAT_THEME = "gruvbox-dark"
let-env EDITOR = "nvim"
let-env TERMINAL = "wezterm"
let-env LANG = "en_US.UTF-8"
let-env _JAVA_AWT_WM_NONREPARENTING = 1
let-env PF_SOURCE = /home/maxim/dokumente/proj/pfetch/addon.sh

let-env TEXINPUTS = [
  /usr/texmf/
  /usr/local/share/texmf/tex/latex/
  /usr/local/share/texmf/fonts/
  /usr/share/texmf-dist/tex/latex/
  /usr/share/texmf-dist/tex/generic/
  /usr/share/texmf-dist/tex4ht/ht-fonts/
  /usr/share/texmf/tex/latex/
  /usr/share/texmf/tex/generic/
  ] | each { |path| (ls $path | select name | each {|| get name } | str join ':') } | str join ':'


# .local/bin
# .cargo/bin
# go/bin
# mujoco-2.1.5/bin

let paths = (cat ~/.bin_dirs | lines | each {|| prepend "/home/maxim/" | str join })

# let-env PATH = ($env.PATH | split row (char esep) | append $paths)
let-env PATH =  ($env.PATH | split row (char esep) | append $paths | str join ':')
