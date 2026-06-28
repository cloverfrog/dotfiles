local wezterm = require("wezterm")

local constants = require("config.constants")

local M = {}

function M.apply(config)
    local act = wezterm.action

    config.keys = {
        -- 智能 Ctrl+C 配置
        {
            key = 'c',
            mods = 'CTRL',
            action = wezterm.action_callback(function(window, pane)
            local has_selection = window:get_selection_text_for_pane(pane) ~= ""
            if has_selection then
                -- 如果有选中文本，执行复制，并清除选中状态
                window:perform_action(act.CopyTo 'Clipboard', pane)
                window:perform_action(act.ClearSelection, pane)
            else
                -- 如果没有选中文本，发送原生的 Ctrl+C 信号给终端
                window:perform_action(act.SendKey { key = 'c', mods = 'CTRL' }, pane)
            end
            end),
        },
    }
end

return M
