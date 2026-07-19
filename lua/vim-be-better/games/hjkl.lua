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

local function printGame()
    local lines = {}

    for _, row in ipairs(game.board) do
        table.insert(lines, table.concat(row))
    end

    vim.bo[Buf].modifiable = true
    ui.setLines(lines)
    vim.bo[Buf].modifiable = false
    print(game.score)
end

local function checkCursor()
    local pos = vim.api.nvim_win_get_cursor(Window)

    local row = pos[1]
    local col = pos[2] + 1 -- must be +1 to accurately represent cursor location

    if game.board[row][col] == "O" then
        game.board[row][col] = "."
        game.score = game.score + 1
        printGame()
    end
end

local function beginGame()
    print("HJKL Starting!")
    printGame()

    vim.api.nvim_create_autocmd("CursorMoved", {
        buffer = Buf,
        callback = checkCursor()
    })
end

return {
    beginGame = beginGame,
}
