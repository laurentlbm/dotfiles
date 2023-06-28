local wezterm = require("wezterm")

local c = {}
if wezterm.config_builder then
  c = wezterm.config_builder()
  c:set_strict_mode(true)
end

require("fonts").apply(c)
-- require("keys").apply(c)
require("theme").apply(c)

-- disable tmux
--c.set_environment_variables = {
--  NO_TMUX = "1",
--}
-- etc.
c.adjust_window_size_when_changing_font_size = false
c.audible_bell = "Disabled"
c.clean_exit_codes = { 130 }
c.default_cursor_style = "BlinkingBar"
c.launch_menu = {
  { args = {"btop"} },
  { label = "Bash", args = {"bash", "-l"} },
  { args = {"ssh", "spica"} },
  { args = {"ssh", "vega"} },
  { args = {"ssh", "delphi"} },
}
c.command_palette_font_size = 14.0
c.window_background_opacity = 0.85
c.window_frame = {
  font_size = 11.0,
}

-- require("bar").apply_to_config(c)

return c
