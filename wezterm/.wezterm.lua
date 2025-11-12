local wezterm = require('wezterm')
local font = wezterm.font('Iosevka Nerd Font')

return {
    font_size = 12,
    font = font,
    color_scheme = 'Catppuccin Mocha',
    use_fancy_tab_bar = false,
    colors = {
        tab_bar = {
            background = '#1e1e2e',
        },
    },
    default_prog = { '/usr/bin/env', 'fish' },
}
