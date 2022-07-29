local wezterm = require 'wezterm';
local catppuccin = require("colors/catppuccin").setup { sync = false }

return {
  font = wezterm.font_with_fallback({
      "DMMono Nerd Font Mono",
      "JetBrainsMono Nerd Font Mono",
      "Fira Code",
    }),
  font_size = 11.0,
  line_height = 1.2,
  default_cursor_style = "BlinkingBar",
  colors = catppuccin,
  launch_menu = {
    {
      args = {"btop"},
    },
    {
      label = "Bash",
      args = {"bash", "-l"},
    },
    {
      args = {"ssh", "spica"},
    },
    {
      args = {"ssh", "vega"},
    },
    {
      args = {"ssh", "delphi"},
    },
  },
  keys = {
    {key="l", mods="ALT", action="ShowLauncher"},
    {key="w", mods="CTRL", action=wezterm.action{CloseCurrentTab={confirm=false}}},
    {key="/", mods="CTRL", action="DisableDefaultAssignment"},
    {key="/", mods="CMD", action="DisableDefaultAssignment"},
  },
  window_background_opacity = 0.8,
  window_padding = {
    left = "1cell",
    right = "1cell",
    top = "0.5cell",
    bottom = "0.5cell",
  },
  hide_tab_bar_if_only_one_tab = true,
  show_tab_index_in_tab_bar = false,
--  use_fancy_tab_bar = false,
--  tab_max_width = 26,
}
