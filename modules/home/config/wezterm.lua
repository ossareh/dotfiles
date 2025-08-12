local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = "nord"
config.font = wezterm.font("Cascadia Code")
config.font_size = 12.0
config.front_end = "WebGpu"
config.hide_tab_bar_if_only_one_tab = true

config.hyperlink_rules = wezterm.default_hyperlink_rules()

return config
