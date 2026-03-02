local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.default_prog = { '/usr/sbin/zsh' }

-- disable tmux
--config.set_environment_variables = {
--  NO_TMUX = "1",
--}
config.adjust_window_size_when_changing_font_size = false
config.audible_bell = "Disabled"
config.clean_exit_codes = { 130 }

config.font_size = 11
config.font = wezterm.font_with_fallback { 'Maple Mono NF' }
config.color_scheme = 'Catppuccin Mocha'
config.default_cursor_style = "BlinkingBar"
-- config.command_palette_font_size = 14.0
config.window_background_opacity = 0.85

config.launch_menu = {
  { label = 'Bash', args = { 'bash', '-l' }, }
}

-- -- Title/tab bar
config.window_frame = {
  active_titlebar_bg = '#181825',
  inactive_titlebar_bg = '#181825',
}
config.colors = {
  tab_bar = {
    background = '181825',
    active_tab = {
      bg_color = '#f9c096',
      fg_color = '#15121c',
    },
    inactive_tab = {
      bg_color = '#332e41',
      fg_color = '#a4aec8',
    },
    inactive_tab_hover = {
      bg_color = '#332e41',
      fg_color = '#dadae8',
    },
    new_tab = {
      bg_color = '#332e41',
      fg_color = '#a4aec8',
    },
    new_tab_hover = {
      bg_color = '#332e41',
      fg_color = '#dadae8',
    },
  }
}

return config
