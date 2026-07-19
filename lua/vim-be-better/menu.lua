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

    -- must be scheduled to prevent stalling
    vim.schedule(function() setMenuMappings() end)
end

return {
    createMainMenu = createMainMenu,
}
