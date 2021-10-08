local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}


--["core.norg.completion"] = {
--    config = {
--    engine = "nvim-cmp" -- We current support nvim-compe and nvim-cmp only
--    }
--}

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"norg", "python", "yaml", "toml", "lua", "latex", "json", "bibtex", 'haskell', 'bash', "java"},
  highlight = {
    enable = true,
    --disable = { "python" },
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 10000, -- Do not enable for files with more than 1000 lines, int
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

    --@block.inner
    --@block.outer
    --@call.inner
    --@call.outer
    --@comment.outer
    --@parameter.inner
    --@parameter.outer
    --@scopename.inner
    --@statement.outer

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["ac"] = "@conditional.outer",
        ["ic"] = "@conditional.inner",


        -- Or you can define your own textobjects like this
        --["iF"] = {
        --  python = "(function_definition) @function",
        --  cpp = "(function_definition) @function",
        --  c = "(function_definition) @function",
        --  java = "(method_declaration) @function",
        } -- keymaps
      } -- select
    } -- textobjects
  }
