local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.cod_file

config.window_decorations = "TITLE | RESIZE"
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true
config.tab_max_width = 24
config.scrollback_lines = 3500

function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local edge_background = '#3f1fd6'
    local edge_foreground = '#808080'
    local foreground = '#909090'

    if tab.is_active then
      foreground = '#b1f9cd'
    elseif hover then
      foreground = '#f5f5f5'
    end

    local title = tab_title(tab)

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    title = wezterm.truncate_right(title, max_width - 2)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = foreground } },
      { Text = SOLID_LEFT_ARROW },
      { Foreground = { Color = foreground } },
      { Text = title },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
    }
  end
)
config.window_frame = {
  active_titlebar_bg = "#795fff",
  inactive_titlebar_bg = "#795fff",
}

config.window_padding = {
  left = 10,
  right = 0,
  bottom = 0,
  top = 10
}
config.window_close_confirmation = 'NeverPrompt'

config.colors = require('colors')
config.background = {
  {
    source = {
      File = wezterm.config_dir .. "/backdrops/background.jpg",
    },
    repeat_x = "NoRepeat",
    vertical_align = "Middle",
    horizontal_align = "Center",
    attachment = "Fixed",
    opacity = 0.85
  }
}
-- config.background = { { source = { Color = "black" } } }
--config.window_background_gradient = {
  --colors = { '#dd77a4', '#273dd4' },
  -- Specifices a Linear gradient starting in the top left corner.
  --orientation = { Linear = { angle = -45.0 } },
--}
return config
