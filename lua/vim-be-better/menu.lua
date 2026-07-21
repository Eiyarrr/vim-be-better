local ui = require("lua.vim-be-better.ui")
local hjkl = require("lua.vim-be-better.games.hjkl")

local function delMappings()
    vim.keymap.del("n", "1")
end

local function setMenuMappings()
    vim.keymap.set("n", "1", function()
        delMappings()
        hjkl.beginGame()
    end)
end

local function createMainMenu(buffer)
    local menu = {
        "VimBeBetter",
        "",
        "HKJL -> '1'",
        "EXIT -> '0'",
    }

    vim.bo[buffer].modifiable = true
    ui.setLines(buffer, menu)
    vim.bo[buffer].modifiable = false

    setMenuMappings()
end

return {
    createMainMenu = createMainMenu,
}
