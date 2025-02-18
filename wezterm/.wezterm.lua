local wezterm = require('wezterm')
local cfg = wezterm.config_builder()

cfg.enable_wayland = false

cfg.font = wezterm.font('FiraCode Nerd Font')
cfg.font_size = 16
cfg.adjust_window_size_when_changing_font_size = false

cfg.color_scheme = 'Catppuccin Macchiato'

cfg.use_fancy_tab_bar = false
cfg.tab_bar_at_bottom = true

cfg.enable_scroll_bar = false
cfg.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

cfg.keys = {
}

return cfg
