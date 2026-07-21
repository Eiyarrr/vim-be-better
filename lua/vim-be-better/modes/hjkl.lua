local function on_task_start(state)
    state.cursor_moved = 0
    state.start_time = os.time()

    print("on_task_start")
end

local function validate(state)
    print("validate")
end

local function on_task_end(state)
    print("on_task_end")
end

return {
    on_task_start = on_task_start,
    validate = validate,
    on_task_end = on_task_end,
}
