local ui = require("lua.vim-be-better.ui")
local hjkl = require("lua.vim-be-better.modes.hjkl")
local hjkllegacy = require("lua.vim-be-better.modes.hjkl-legacy")

local function delMappings()
    vim.keymap.del("n", "1")
    vim.keymap.del("n", "2")
end

local function setMenuMappings(buffer, window)
    vim.keymap.set("n", "1", function()
        delMappings()
        hjkl.beginGame(buffer, window)
    end)
    vim.keymap.set("n", "2", function()
        delMappings()
        hjkllegacy.beginGame(buffer, window)
    end)
end

local function createMainMenu(buffer, window)
    local menu = {
        "VimBeBetter",
        "",
        "HKJL (NEW) -> '1'",
        "HKJL (OLD) -> '2'",
        "EXIT -> ':q'",
    }

    vim.bo[buffer].modifiable = true
    ui.setLines(buffer, menu)
    vim.bo[buffer].modifiable = false

    setMenuMappings(buffer, window)
end

return {
    createMainMenu = createMainMenu,
}
