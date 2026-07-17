local function createMenu(buf)
    print("creating menu")

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

local function setLines(buf, lines)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    return buf
end

return {
    createMenu = createMenu,
    setLines = setLines,
}
