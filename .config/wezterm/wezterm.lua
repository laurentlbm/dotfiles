local wezterm = require 'wezterm';

return {
  font = wezterm.font_with_fallback({
      "DMMono Nerd Font",
      "JetBrainsMono Nerd Font Mono",
      "Fira Code",
    }),
  font_size = 10.0,
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
  },
  keys = {
    {key="l", mods="ALT", action="ShowLauncher"},
  },
  window_background_opacity = 0.8,
  use_fancy_tab_bar = false,
  colors = {
      tab_bar = {
        -- The color of the strip that goes along the top of the window
        -- (does not apply when fancy tab bar is in use)
        background = "#0b0022",

        -- The active tab is the one that has focus in the window
        active_tab = {
          -- The color of the background area for the tab
          bg_color = "#2b2042",
          -- The color of the text for the tab
          fg_color = "#c0c0c0",

          -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
          -- label shown for this tab.
          -- The default is "Normal"
          intensity = "Normal",

          -- Specify whether you want "None", "Single" or "Double" underline for
          -- label shown for this tab.
          -- The default is "None"
          underline = "None",

          -- Specify whether you want the text to be italic (true) or not (false)
          -- for this tab.  The default is false.
          italic = false,

          -- Specify whether you want the text to be rendered with strikethrough (true)
          -- or not for this tab.  The default is false.
          strikethrough = false,
        },

        -- Inactive tabs are the tabs that do not have focus
        inactive_tab = {
          bg_color = "#1b1032",
          fg_color = "#808080",

          -- The same options that were listed under the `active_tab` section above
          -- can also be used for `inactive_tab`.
        },

        -- You can configure some alternate styling when the mouse pointer
        -- moves over inactive tabs
        inactive_tab_hover = {
          bg_color = "#3b3052",
          fg_color = "#909090",
          italic = true,

          -- The same options that were listed under the `active_tab` section above
          -- can also be used for `inactive_tab_hover`.
        },

        -- The new tab button that let you create new tabs
        new_tab = {
          bg_color = "#1b1032",
          fg_color = "#808080",

          -- The same options that were listed under the `active_tab` section above
          -- can also be used for `new_tab`.
        },

        -- You can configure some alternate styling when the mouse pointer
        -- moves over the new tab button
        new_tab_hover = {
          bg_color = "#3b3052",
          fg_color = "#909090",
          italic = true,

          -- The same options that were listed under the `active_tab` section above
          -- can also be used for `new_tab_hover`.
        }
      }
    },
}
