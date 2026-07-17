local ui = require("vim-be-better.ui")

local function start()
    local window = ui.createMenu()
    print("start")
end

local function setup()
    vim.api.nvim_create_user_command("VimBeBetter", function() start() end, {})
end

return {
    setup = setup,
}
