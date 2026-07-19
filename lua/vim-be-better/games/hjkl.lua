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

local function checkCursor()
    local pos = vim.api.nvim_win_get_cursor(Window)

    local row = pos[1]
    local col = pos[2] + 1 -- must be +1 to accurately represent cursor location

    if game.board[row][col] == "O" then
        game.board[row][col] = "."
        game.score = game.score + 1
        print(game.score)
    end
end

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

    vim.api.nvim_create_autocmd("CursorMoved", {
        buffer = Buf,
        callback = checkCursor()
    })
end

return {
    beginGame = beginGame,
}
