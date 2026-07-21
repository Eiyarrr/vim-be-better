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

    local randRow = math.random(rows - 1)
    local randCol = math.random(cols - 1)

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

local function printGame(buffer)
    local lines = {}

    for _, row in ipairs(game.board) do
        table.insert(lines, table.concat(row))
    end

    vim.bo[buffer].modifiable = true
    ui.setLines(buffer, lines)
    vim.bo[buffer].modifiable = false
    print("Score: " .. game.score)
end

local function checkCursor(buffer, window)
    local pos = vim.api.nvim_win_get_cursor(window)

    local row = pos[1]
    local col = pos[2] + 1 -- must be +1 to accurately represent cursor location

    if game.board[row][col] == "O" then
        game.score = game.score + 1
        populateBoard()
        printGame(buffer)
    end
end

local function beginGame(buffer, window)
    print("HJKL Starting!")
    populateBoard()
    printGame(buffer)

    vim.api.nvim_create_autocmd("CursorMoved", {
        buffer = buffer,
        callback = function() checkCursor(buffer, window) end
    })
end

return {
    beginGame = beginGame,
}
