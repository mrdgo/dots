local api = vim.api
local M = {}

function M.makeScratch()
    api.nvim_command('enew')
    api.bo[0].buftype='nofile'
    api.bo[0].bufhidden='hide'
    api.bo[0].swapfile=false
end

return M
