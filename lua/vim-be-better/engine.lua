local ui = require("lua.vim-be-better.ui")
local menu = require("lua.vim-be-better.menu")

-- function pre-declaration
local start
local pre_task
local validate
local post_task
local cleanup

local state = {
    buffer = nil,
    window = nil,
    rng = nil,
    mode = nil,
    difficulty = nil,
    cursor_moves = 0,
    start_time = nil,
}

local function setup()
    -- create buffer
    local buffer = vim.api.nvim_create_buf(false, true)
    vim.bo[buffer].buftype = "nofile"
    vim.bo[buffer].bufhidden = "wipe"
    vim.bo[buffer].swapfile = false
    vim.bo[buffer].modifiable = false

    -- create window
    local window = ui.createWindow(buffer)

    -- filling state
    state.buffer = buffer
    state.window = window
    state.rng = math.randomseed(os.time())

    start()
end

start = function()
    -- fill buffer with main menu contents
    menu.create_mode_menu(state.buffer, function(mode, difficulty)
        state.mode = mode
        state.difficulty = difficulty

        -- create autocmds
        vim.api.nvim_create_autocmd("CursorMoved", {
            buffer = state.buffer,
            callback = function()
                state.cursor_moves = state.cursor_moves + 1
                validate()
            end,
        })

        vim.api.nvim_create_autocmd("TextChanged", {
            buffer = state.buffer,
            callback = function() validate() end,
        })

        vim.api.nvim_create_autocmd("InsertLeave", {
            buffer = state.buffer,
            callback = function() validate() end,
        })

        vim.api.nvim_create_autocmd("WinClosed", {
            buffer = state.buffer,
            callback = function(args)
                -- args.match is a string containing the closed window's ID
                -- (why it's a string I will never know)
                local closed_window = tonumber(args.match)

                if closed_window == state.window then
                    cleanup()
                end
            end,
        })

        pre_task()
    end)
end

pre_task = function()
    state.mode.on_task_start(state)
end

validate = function()
    local task_completed = state.mode.validate(state)
    if task_completed then
        state.mode.on_task_end(state)
        post_task()
    end
end

post_task = function()
    pre_task()
end

cleanup = function(args)
end

return {
    setup = setup,
    state = state,
}
