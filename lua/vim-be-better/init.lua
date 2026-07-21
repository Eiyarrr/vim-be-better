local engine = require("lua.vim-be-better.engine")
local games_registry = require("lua.vim-be-better.games.registry")

local function setup()
    vim.api.nvim_create_user_command("VimBeBetter", function() engine.start(games_registry.hjkl, 0) end, {})
end

return {
    setup = setup,
}
