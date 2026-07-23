local registry = require("lua.vim-be-better.modes.registry")
local ui = require("lua.vim-be-better.ui")

-- function predeclaration
local set_mappings_mode
local del_mappings_mode
local set_mappings_difficulty
local del_mappings_difficulty

local mode
local difficulty

local function create_main_menu(buffer)

    -- generate menu
    local menu = {
        "VimBeBetter",
        "",
        "HKJL -> '1'",
        "EXIT -> ':q'",
    }

    vim.bo[buffer].modifiable = true
    ui.setLines(buffer, menu)
    vim.bo[buffer].modifiable = false

    set_mappings_mode()

    return {
        mode,
        difficulty,
    }
end

set_mappings_mode = function()
    vim.keymap.set("n", "1", function()
        del_mappings_mode()
        mode = registry.hjkl
    end)
end

del_mappings_mode = function()
    vim.keymap.del("n", "1")
end

set_mappings_difficulty = function()
    vim.keymap.set("n", "1", function()
        del_mappings_difficulty()
        difficulty = "easy"
    end)
    vim.keymap.set("n", "2", function()
        del_mappings_difficulty()
        difficulty = "medium"
    end)
    vim.keymap.set("n", "3", function()
        del_mappings_difficulty()
        difficulty = "hard"
    end)
    vim.keymap.set("n", "4", function()
        del_mappings_difficulty()
        difficulty = "challenge"
    end)
end

del_mappings_difficulty = function()
    vim.keymap.del("n", "1")
    vim.keymap.del("n", "2")
    vim.keymap.del("n", "3")
    vim.keymap.del("n", "4")
end

return {
    create_main_menu = create_main_menu,
}
