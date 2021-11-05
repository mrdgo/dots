vim.o.sessionoptions="blank,buffers,curdir,help,options"

require"auto-session".setup {
    log_level = "error",
    auto_session_enable_last_session = false,
    auto_session_root_dir = vim.fn.stdpath"config".."/nvim_sessions/",
    auto_session_enabled = true,
    auto_save_enabled = true,
    auto_restore_enabled = false,
    auto_session_suppress_dirs = {"~", "/run/user/1000/firenvim/"}
}

require"session-lens".setup {
    prompt_title = "Sessions",
    path_display = {"smart"},
    theme_conf = { border = true },
    previewer = false,
}

vim.api.nvim_set_keymap(
    "n",
    "<Leader>up",
    "<cmd>lua require'telescope._extensions.session-lens.main'.search_session()<CR>",
    { noremap=true, silent=true }
)

vim.api.nvim_set_keymap(
    "n",
    "<Leader>sc",
    ":lua require'session_setup'.save_session()",
    { noremap=true, silent=false }
)

local function save_session()
    -- vim.cmd[[SaveSession]]
    require"auto-session".AutoSaveSession()
    vim.cmd[[cd ~]]
    vim.cmd("%bd!")
    -- delete buffers
    vim.cmd[[Alpha]]
end

return {
    save_session = save_session
}
