local registry = require("lua.vim-be-better.modes.registry")
local ui = require("lua.vim-be-better.ui")

-- function predeclaration
local set_mappings_mode
local del_mappings_mode
local create_difficulty_menu
local set_mappings_difficulty
local del_mappings_difficulty

local mode

local function create_mode_menu(buffer, on_complete)
    -- generate menu
    local menu = {
        "VimBeBetter",
        "",
        "HKJL -> '1'",
        "EXIT -> ':q'",
    }

    -- modify buffer to show menu
    vim.bo[buffer].modifiable = true
    ui.setLines(buffer, menu)
    vim.bo[buffer].modifiable = false

    set_mappings_mode(buffer, on_complete)
end

set_mappings_mode = function(buffer, on_complete)
    vim.keymap.set("n", "1", function()
        del_mappings_mode(buffer)
        create_difficulty_menu(buffer, on_complete)
        mode = registry.hjkl
    end, { buffer = buffer })
end

del_mappings_mode = function(buffer)
    vim.keymap.del("n", "1", { buffer = buffer })
end

create_difficulty_menu = function(buffer, on_complete)
    local menu = {
        "VimBeBetter",
        "",
        "Easy -> 1",
        "Medium -> 2",
        "Hard -> 3",
        "Challenge -> 4",
    }

    -- modify buffer to show menu
    vim.bo[buffer].modifiable = true
    ui.setLines(buffer, menu)
    vim.bo[buffer].modifiable = false

    set_mappings_difficulty(buffer, on_complete)
end

set_mappings_difficulty = function(buffer, on_complete)
    vim.keymap.set("n", "1", function()
        del_mappings_difficulty(buffer)
        on_complete(mode, "easy")
    end, { buffer = buffer })
    vim.keymap.set("n", "2", function()
        del_mappings_difficulty(buffer)
        on_complete(mode, "medium")
    end, { buffer = buffer })
    vim.keymap.set("n", "3", function()
        del_mappings_difficulty(buffer)
        on_complete(mode, "hard")
    end, { buffer = buffer })
    vim.keymap.set("n", "4", function()
        del_mappings_difficulty(buffer)
        on_complete(mode, "challenge")
    end, { buffer = buffer })
end

del_mappings_difficulty = function(buffer)
    vim.keymap.del("n", "1", { buffer = buffer })
    vim.keymap.del("n", "2", { buffer = buffer })
    vim.keymap.del("n", "3", { buffer = buffer })
    vim.keymap.del("n", "4", { buffer = buffer })
end

return {
    create_mode_menu = create_mode_menu,
}
