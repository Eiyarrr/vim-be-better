--[[
    Literally the same as vim-be-good's hjkl
    Use 'H', 'J', 'K', 'L' to move around the terminal,
    hover over the 'O' to remove it.
--]]
local ui = require("lua.vim-be-better.ui")

local game = {
    score = 0,
    board = {}
}

local function populateBoard()
    game.board = {}

    local dimensions = ui.getWindowDimensions()
    local rows = dimensions.height / 5
    local cols = dimensions.width / 5

    local randRow = math.random(rows)
    local randCol = math.random(cols)

    for r = 1, rows, 1 do
        local inner = {}
        for c = 1, cols, 1 do
            if r == randRow and c == randCol then
                table.insert(inner, "O")
            else
                table.insert(inner, ".")
            end
        end
        table.insert(game.board, inner)
    end
end

local function printGame()
    local lines = {}

    for _, row in ipairs(game.board) do
        table.insert(lines, table.concat(row))
    end

    vim.bo[Buf].modifiable = true
    ui.setLines(lines)
    vim.bo[Buf].modifiable = false
    print("Score: " .. game.score)
end

local function checkCursor()
    local pos = vim.api.nvim_win_get_cursor(Window)

    local row = pos[1]
    local col = pos[2] + 1 -- must be +1 to accurately represent cursor location

    if game.board[row][col] == "O" then
        game.score = game.score + 1
        populateBoard()
        printGame()
    end
end

local function beginGame()
    print("HJKL Starting!")
    populateBoard()
    printGame()

    vim.api.nvim_create_autocmd("CursorMoved", {
        buffer = Buf,
        callback = function() checkCursor() end
    })
end

return {
    beginGame = beginGame,
}
