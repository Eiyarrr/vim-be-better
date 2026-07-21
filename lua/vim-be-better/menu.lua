local ui = require("lua.vim-be-better.ui")
local hjkl = require("lua.vim-be-better.games.hjkl")

local function delMappings()
    vim.keymap.del("n", "1")
end

local function setMenuMappings(buffer, window)
    vim.keymap.set("n", "1", function()
        delMappings()
        hjkl.beginGame(buffer, window)
    end)
end

local function createMainMenu(buffer, window)
    local menu = {
        "VimBeBetter",
        "",
        "HKJL -> '1'",
        "EXIT -> '0'",
    }

    vim.bo[buffer].modifiable = true
    ui.setLines(buffer, menu)
    vim.bo[buffer].modifiable = false

    setMenuMappings(buffer, window)
end

return {
    createMainMenu = createMainMenu,
}
