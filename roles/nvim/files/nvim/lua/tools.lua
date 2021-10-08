local function createFloat()
    local stats = vim.api.nvim_list_uis()[1]
    local width = stats.width
    local height = stats.height
    local ft = vim.bo.filetype

    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_open_win(buf, true, {
        relative="editor",
        width = width - 4,
        height = height - 4,
        col = 2,
        row = 2,
    })
    vim.api.nvim_paste(vim.fn.getreg('"'), false, -1)
    vim.bo.filetype = ft
end

local function createEmpty()
    local buf = vim.api.nvim_create_buf(true, false)
    vim.api.nvim_set_current_buf(buf)
end

return {
    createFloat = createFloat,
    createEmpty = createEmpty,
}
