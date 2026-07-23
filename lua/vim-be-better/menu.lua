local registry = require("lua.vim-be-better.modes.registry")
local ui = require("lua.vim-be-better.ui")

-- function predeclaration
local set_mappings_mode
local del_mappings_mode
local create_difficulty_menu
local set_mappings_difficulty
local del_mappings_difficulty

local mode
local difficulty

local function create_mode_menu(buffer)
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

    set_mappings_mode(buffer)

    return {
        mode,
        difficulty,
    }
end

set_mappings_mode = function(buffer)
    vim.keymap.set("n", "1", function()
        del_mappings_mode()
        create_difficulty_menu(buffer)
        mode = registry.hjkl
    end, { buffer = buffer })
end

del_mappings_mode = function()
    vim.keymap.del("n", "1")
end

create_difficulty_menu = function(buffer)
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

    set_mappings_difficulty(buffer)
end

set_mappings_difficulty = function(buffer)
    vim.keymap.set("n", "1", function()
        del_mappings_difficulty()
        difficulty = "easy"
    end, { buffer = buffer })
    vim.keymap.set("n", "2", function()
        del_mappings_difficulty()
        difficulty = "medium"
    end, { buffer = buffer })
    vim.keymap.set("n", "3", function()
        del_mappings_difficulty()
        difficulty = "hard"
    end, { buffer = buffer })
    vim.keymap.set("n", "4", function()
        del_mappings_difficulty()
        difficulty = "challenge"
    end, { buffer = buffer })
end

del_mappings_difficulty = function()
    vim.keymap.del("n", "1")
    vim.keymap.del("n", "2")
    vim.keymap.del("n", "3")
    vim.keymap.del("n", "4")
end

return {
    create_mode_menu = create_mode_menu,
}
