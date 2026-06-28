local M = {}

function M.apply(config)
    -- -- 窗口装饰样式
    -- config.window_decorations = "RESIZE"

    -- -- 窗口行为
    -- config.adjust_window_size_when_changing_font_size = false
    -- config.window_close_confirmation = "NeverPrompt"

    -- 设置默认大小为 120 列宽，30 行高
    config.initial_cols = 120
    config.initial_rows = 30
end

return M
