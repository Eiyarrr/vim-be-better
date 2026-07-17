local ui = require("vim-be-better.ui")

local function createMenu(buf)
    local menu = {
        "VimBeBetter",
        "",
        "Use h/j/k/l to move",
        "Use 'dd' to select a mode",
        "",
        "HKJL",
    }
    ui.setLines(buf, menu)

    return buf
end

return {
    createMenu = createMenu,
}
