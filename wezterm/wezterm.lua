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
-- config.color_scheme = "Monokai Vivid"
-- config.color_scheme = "Espresso Libre"
local scheme_def = wezterm.color.get_builtin_schemes()[config.color_scheme]
config.colors = {
  tab_bar = {
    active_tab = {
      bg_color = scheme_def.background,
      fg_color = scheme_def.foreground,
    }
  }
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

-- keys
config.keys = {
    {key="1", mods="ALT", action=wezterm.action{ActivateTab=0}},
    {key="2", mods="ALT", action=wezterm.action{ActivateTab=1}},
    {key="3", mods="ALT", action=wezterm.action{ActivateTab=2}},
    {key="4", mods="ALT", action=wezterm.action{ActivateTab=3}},
    {key="5", mods="ALT", action=wezterm.action{ActivateTab=4}},
    {key="6", mods="ALT", action=wezterm.action{ActivateTab=5}},
    {key="7", mods="ALT", action=wezterm.action{ActivateTab=6}},
    {key="8", mods="ALT", action=wezterm.action{ActivateTab=7}},
    {key="9", mods="ALT", action=wezterm.action{ActivateTab=8}},
}

return config

