local function difficulty_to_int(state)
    local difficulty = state.difficulty

    if difficulty == "easy" then
        return 1
    elseif difficulty == "medium" then
        return 2
    elseif difficulty == "hard" then
        return 3
    elseif difficulty == "challenge" then
        return 4
    end
end
