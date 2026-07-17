local ui = require("vim-be-better.ui")
local menu = require("lua.vim-be-better.menu")

local function start()
    local buf = vim.api.nvim_create_buf(false, true)
    vim.bo[buf].buftype = "nofile"
    vim.bo[buf].bufhidden = "wipe"
    vim.bo[buf].swapfile = false

    menu.createMenu(buf)

    local window = ui.createWindow(buf)
    print("start")
end

local function setup()
    vim.api.nvim_create_user_command("VimBeBetter", function() start() end, {})
end

return {
    setup = setup,
}
