local hjkl = require("lua.vim-be-better.games.hjkl")

local function startHJKL()
    print("starting hjkl")
    hjkl.beginGame()
end

return {
    startHJKL = startHJKL,
}
