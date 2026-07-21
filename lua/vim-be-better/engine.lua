local ui = require("lua.vim-be-better.ui")
local menu = require("lua.vim-be-better.menu")

local function start(game, difficulty)
    -- create buffer
    local buffer = vim.api.nvim_create_buf(false, true)
    vim.bo[buffer].buftype = "nofile"
    vim.bo[buffer].bufhidden = "wipe"
    vim.bo[buffer].swapfile = false

    -- fill buffer with main menu contents
    menu.createMainMenu()

    -- create window
    local window = ui.createWindow()
end

return {
    start = start
}
