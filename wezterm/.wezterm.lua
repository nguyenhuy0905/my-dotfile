local wezterm = require('wezterm')
local cfg = wezterm.config_builder()

cfg.enable_wayland = false
cfg.font = wezterm.font('FiraCode Nerd Font')
cfg.font_size = 16
cfg.color_scheme = 'Catppuccin Macchiato'
cfg.use_fancy_tab_bar = false
cfg.tab_bar_at_bottom = true

return cfg
