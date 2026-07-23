local engine = require("lua.vim-be-better.engine")

local function setup()
    vim.api.nvim_create_user_command("VimBeBetter", function() engine.setup() end, {})
end

return {
    setup = setup,
}
