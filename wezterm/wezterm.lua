local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- system
config.term = "xterm-256color"
config.automatically_reload_config = true
config.check_for_updates = false
config.front_end = "OpenGL"
config.enable_wayland = false

-- font
config.font = wezterm.font("JetBrainsMono Nerd Font", {
    weight = "Regular",
    stretch = "Normal",
    style = "Normal",
})
config.font_size = 13

-- colors
config.color_scheme = "Dark+"
local scheme_def = wezterm.color.get_builtin_schemes()[config.color_scheme]
config.colors = {
    tab_bar = {
        active_tab = {
            bg_color = scheme_def.background,
            fg_color = scheme_def.foreground,
        }
    },
    scrollbar_thumb = "#5f5f5f",
}
config.inactive_pane_hsb = {
    brightness = 0.8,
    saturation = 0.9,
}

-- appearance
config.initial_cols = 185
config.initial_rows = 48
config.window_frame = {
    font = wezterm.font({
        family = 'Ubuntu',
        weight = 'Regular',
    })
}
config.window_padding = {
    left = 10,
    right = 10,
    top = 5,
    bottom = 5,
}
config.window_decorations = "TITLE|RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.scrollback_lines = 5000
config.enable_scroll_bar = true

-- cursor
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 500

-- keys
config.keys = {
    { key = "C", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
    { key = "V", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
}
for i = 1, 9 do
    table.insert(config.keys, { key = tostring(i), mods = "ALT", action = wezterm.action.ActivateTab(i - 1) })
end

return config

