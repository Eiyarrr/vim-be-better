local engine = require("lua.vim-be-better.engine")
local registry = require("lua.vim-be-better.modes.registry")
local ui = require("lua.vim-be-better.ui")

local function delMappings()
    vim.keymap.del("n", "1")
    vim.keymap.del("n", "2")
end

local function setMenuMappings()
    vim.keymap.set("n", "1", function()
        delMappings()
        engine.state.mode = registry.hjkl
    end)
    vim.keymap.set("n", "2", function()
        delMappings()
        engine.state.mode = registry.hjkllegacy
    end)
end

local function createMainMenu(buffer)
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

    setMenuMappings()
end

return {
    createMainMenu = createMainMenu,
}
