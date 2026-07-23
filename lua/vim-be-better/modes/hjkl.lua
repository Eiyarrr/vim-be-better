local ui = require("lua.vim-be-better.ui")

local game = {
    score = 0,
    board = {}
}

local function on_task_start(state)
    state.cursor_moved = 0
    state.start_time = os.time()

    -- populateBoard()
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

    -- printGame()
    local lines = {}

    for _, row in ipairs(game.board) do
        table.insert(lines, table.concat(row))
    end

    vim.bo[state.buffer].modifiable = true
    ui.setLines(state.buffer, lines)
    vim.bo[state.buffer].modifiable = false
    print("Score: " .. game.score)
end

local function on_task_end(state)
    on_task_start(state)

    print("on_task_end")
end

local function validate(state)
    -- checkCursor
    local pos = vim.api.nvim_win_get_cursor(state.window)

    local row = pos[1]
    local col = pos[2] + 1 -- must be +1 to accurately represent cursor location

    if game.board[row][col] == "O" then
        game.score = game.score + 1
    end

    on_task_end(state)

    print("validate")
end

return {
    on_task_start = on_task_start,
    validate = validate,
    on_task_end = on_task_end,
}
