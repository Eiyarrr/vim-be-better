local ui = require("lua.vim-be-better.ui")
local hjkl = require("lua.vim-be-better.games.hjkl")

local function setMenuMappings()
    vim.keymap.set("n", "1", hjkl.beginGame)
end

local function createMainMenu()
    local menu = {
        "VimBeBetter",
        "",
        "HKJL -> '1'",
        "EXIT -> '0'",
    }
    ui.setLines(menu)

    setMenuMappings()
end

return {
    createMainMenu = createMainMenu,
    setMenuMappings = setMenuMappings,
}
