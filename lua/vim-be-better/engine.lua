local ui = require("lua.vim-be-better.ui")
local menu = require("lua.vim-be-better.menu")

-- function pre-declaration
local validate

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

    -- filling state
    state.buffer = buffer
    state.window = window
    state.rng = math.randomseed(os.time())
    state.mode = mode
    state.difficulty = difficulty
    state.cursor_moves = 0
    state.start_time = os.time()

    -- create autocmds
    vim.api.nvim_create_autocmd("CursorMoved", {
        buffer = buffer,
        callback = function() validate() end,
    })

    vim.api.nvim_create_autocmd("TextChanged", {
        buffer = buffer,
        callback = function() validate() end,
    })

    vim.api.nvim_create_autocmd("InsertLeave", {
        buffer = buffer,
        callback = function() validate() end,
    })
end

validate = function()
    local is_valid = state.mode.validate(state)
    if is_valid then    
        state.mode.on_task_end(state)
        print("valid!")
    end
end

return {
    state = state,
    start = start,
}
