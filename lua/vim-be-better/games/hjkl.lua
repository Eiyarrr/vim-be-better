--[[
    Literally the same as vim-be-good's hjkl
    Use 'H', 'J', 'K', 'L' to move around the terminal,
    hover over the 'O' to remove it.
--]]
local ui = require("lua.vim-be-better.ui")

local game = {
    score = 0,
    board = {
        { ".", ".", ".", "O", "." },
        { ".", "O", ".", ".", "." },
    }
}

local function beginGame()
    print("HJKL Starting!")
    vim.bo[Buf].modifiable = true
    local lines = {
        "Game: HJKL",
        "----------",
        "X",
        "I",
    }
    ui.setLines(lines)
end

return {
    beginGame = beginGame,
}
