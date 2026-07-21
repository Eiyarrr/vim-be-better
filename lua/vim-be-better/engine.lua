local ui = require("lua.vim-be-better.ui")
local menu = require("lua.vim-be-better.menu")

local state = {
    buffer = nil,
    window = nil,
    rng = nil,
    mode = nil,
    difficulty = nil,
    cursor_moves = nil,
    start_time = nil,
}

local function start(mode, difficulty)
    -- create buffer
    local buffer = vim.api.nvim_create_buf(false, true)
    vim.bo[buffer].buftype = "nofile"
    vim.bo[buffer].bufhidden = "wipe"
    vim.bo[buffer].swapfile = false
    vim.bo[buffer].modifiable = false

    -- create window
    local window = ui.createWindow(buffer)

    -- fill buffer with main menu contents
    menu.createMainMenu(buffer, window)

    state.buffer = buffer
    state.window = window
end

return {
    state = state,
    start = start,
}
