local function setup()
    vim.api.nvim_create_user_command("VimBeBetter", function() print("VimBeBetter Command Works :3") end, {})
end

return {
    setup = setup,
}
