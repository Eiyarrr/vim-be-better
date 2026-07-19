local ui = require("lua.vim-be-better.ui")
local menu = require("lua.vim-be-better.menu")

local function start()
    Buf = vim.api.nvim_create_buf(false, true)
    vim.bo[Buf].buftype = "nofile"
    vim.bo[Buf].bufhidden = "wipe"
    vim.bo[Buf].swapfile = false

    menu.createMainMenu()
    vim.bo[Buf].modifiable = false

    ui.createWindow()
end

local function setup()
    vim.api.nvim_create_user_command("VimBeBetter", function() start() end, {})
end

return {
    setup = setup,
}
