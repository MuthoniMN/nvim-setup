local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.window_decorations = "TITLE | RESIZE"
config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.scrollback_lines = 3500

config.window_padding = {
  left = 10,
  right = 0,
  bottom = 10,
  top = 10
}


config.colors = require("colors")
config.window_background_opacity = 0.75
--config.window_background_gradient = {
  --colors = { '#dd77a4', '#273dd4' },
  -- Specifices a Linear gradient starting in the top left corner.
  --orientation = { Linear = { angle = -45.0 } },
--}
return config
