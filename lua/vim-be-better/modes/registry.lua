local modes = "lua.vim-be-better.modes."

return {
    ["hjkl"] = require(modes .. "hjkl"),
    ["hjkl-legacy"] = require(modes .. "hjkl-legacy"),
}
