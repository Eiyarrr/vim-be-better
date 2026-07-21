local engine = require("lua.vim-be-better.engine")
local modes_registry = require("lua.vim-be-better.modes.registry")

local function setup()
    vim.api.nvim_create_user_command("VimBeBetter", function() engine.start(modes_registry["hjkl-legacy"], 0) end, {})
end

return {
    setup = setup,
}
