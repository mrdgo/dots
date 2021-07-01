require'nvim-treesitter.configs'.setup {
  ensure_installed = {"python", "yaml", "lua", "latex", "json", "bibtex", 'haskell', 'bash'},
  highlight = {
    enable = true,
    --disable = { "python" },
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 10000, -- Do not enable for files with more than 1000 lines, int
  }
}
