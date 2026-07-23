local function createWindow(buffer)
    local width = 150
    local height = 50

    local window = vim.api.nvim_open_win(buffer, true, {
        relative = "editor",
        width = width,
        height = height,
        row = math.floor((vim.o.lines - height) / 2),
        col = math.floor((vim.o.columns - width) / 2),
        border = "rounded",
    })

    return window
end

local function setLines(buffer, lines)
    vim.api.nvim_buf_set_lines(buffer, 0, -1, false, lines)
end

local function getWindowDimensions()
    return {
        width = vim.api.nvim_win_get_width(0),
        height = vim.api.nvim_win_get_height(0)
    }
end

return {
    createWindow = createWindow,
    setLines = setLines,
    getWindowDimensions = getWindowDimensions,
}
