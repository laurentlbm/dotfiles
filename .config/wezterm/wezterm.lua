local wezterm = require 'wezterm';

return {
  font = wezterm.font_with_fallback({
      "DMMono Nerd Font Mono",
      "JetBrainsMono Nerd Font Mono",
      "Fira Code",
    }),
  font_size = 10.0,
  line_height = 1.1,
  color_scheme = "Dracula",
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
  use_fancy_tab_bar = false,
  tab_max_width = 26,
  colors = {
    tab_bar = {
      background = "#454158",
      active_tab = {
        bg_color = "#9580ff",
        fg_color = "#22212c",
      },
      inactive_tab = {
        bg_color = "#454158",
        fg_color = "#f2f2f8",
      },
      inactive_tab_hover = {
        bg_color = "#7970a9",
        fg_color = "#f2f2f8",
        intensity = "Bold",
        italic = true,
      },
      new_tab = {
        bg_color = "#454158",
        fg_color = "#f2f2f8",
      },
      new_tab_hover = {
        bg_color = "#ffca80",
        fg_color = "#22212c",
        intensity = "Bold",
      },
    },
  },
}
