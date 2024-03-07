-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- config.color_scheme = 'AdventureTime'

config.font_size = 15.0
config.font_dirs = {'.local/share/wezterm/fonts'}

config.font = wezterm.font 'Fira Code'

return config

