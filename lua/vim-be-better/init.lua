local ui = require("vim-be-better.ui")

local function start()
    local buf = vim.api.nvim_create_buf(false, true)
    vim.bo[buf].buftype = "nofile"
    vim.bo[buf].bufhidden = "wipe"
    vim.bo[buf].swapfile = false
    vim.bo[buf].modifiable = false

    local menu = {
        "VimBeBetter",
        "",
        "Use h/j/k/l to move",
        "Use 'dd' to select a mode",
        "",
        "HKJL",
    }

    ui.setLines(buf, menu)

    local window = ui.createMenu(buf)
    print("start")
end

local function setup()
    vim.api.nvim_create_user_command("VimBeBetter", function() start() end, {})
end

return {
    setup = setup,
}
