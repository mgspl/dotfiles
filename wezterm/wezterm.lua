-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.enable_wayland = false

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Mocha'

config.font = wezterm.font("UbuntuMono Nerd Font")

config.font_size = 14

config.warn_about_missing_glyphs = false

config.prefer_to_spawn_tabs = true

config.hide_tab_bar_if_only_one_tab = true

config.detect_password_input = true

config.default_prog = { 'bash' }

return config
