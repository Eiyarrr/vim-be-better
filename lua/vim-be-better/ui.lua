local function createMenu()
    print("creating menu")

    local buf = vim.api.nvim_create_buf(false, true)

    local width = 150
    local height = 50

    local window = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = math.floor((vim.o.lines - height) / 2),
        col = math.floor((vim.o.columns - width) / 2),
        border = "rounded",
    })

    return {
        buf = buf,
        window = window,
    }
end

return {
    createMenu = createMenu,
}
