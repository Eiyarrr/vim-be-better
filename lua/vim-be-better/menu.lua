local ui = require("lua.vim-be-better.ui")
local gameStarter = require("lua.vim-be-better.games.gameStarter")

local function createMenu(buf)
    local menu = {
        "VimBeBetter",
        "",
        "HKJL -> '1'",
        "EXIT -> '0'",
    }
    ui.setLines(buf, menu)

    return buf
end

local function setMenuMappings(buf)
    vim.keymap.set("n", "1", gameStarter.hjkl, { buffer = buf })
end

return {
    createMenu = createMenu,
    setMenuMappings = setMenuMappings,
}
