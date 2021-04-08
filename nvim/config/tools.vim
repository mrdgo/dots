fun! ToolsPlugin()
    "lua for k in pairs(package.loaded) do if k:match("^tools") then package.loaded[k] = nil end end
    lua require'tools'.createFloat()
endfun

nmap <leader>pl :lua require'tools'.createFloat()<CR>
