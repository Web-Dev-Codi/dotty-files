local wezterm = require("wezterm")
local config = wezterm.config_builder()
-- local mux = wezterm.mux
-- local act = wezterm.action

config.colors = require("cyberdream")

config.force_reverse_video_cursor = true
config.automatically_reload_config = true
config.enable_tab_bar = true
config.use_fancy_tab_bar = true
config.freetype_load_target = "Normal"
config.freetype_render_target = "Normal"
config.window_decorations = "TITLE|RESIZE"
config.integrated_title_button_style = "Gnome"
config.integrated_title_buttons = { "Hide", "Maximize", "Close" }
config.font = wezterm.font("JetBrains Mono", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.tab_bar_at_bottom = true
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.max_fps = 60 -- Reduced from 120 to decrease CPU load
config.window_close_confirmation = "AlwaysPrompt"
config.hide_tab_bar_if_only_one_tab = false
-- Reduce opacity for better text visibility
config.window_background_opacity = 0.65
config.audible_bell = "Disabled"
-- Enable bold brightening for better contrast
config.bold_brightens_ansi_colors = true
config.default_cursor_style = "BlinkingBar"

-- Color overrides for better visibility
config.colors = config.colors or {}
config.colors.foreground = "#ffffff" -- Ensure bright white text
config.colors.background = "#16181a" -- Dark background for contrast

-- Tab bar colors for better visibility
config.colors.tab_bar = {
	background = "#1e2124",
	active_tab = {
		bg_color = "#5865f2",
		fg_color = "#ffffff",
		intensity = "Bold",
	},
	inactive_tab = {
		bg_color = "#2f3136",
		fg_color = "#b9bbbe",
	},
	inactive_tab_hover = {
		bg_color = "#40444b",
		fg_color = "#ffffff",
	},
}

-- Performance optimizations to reduce CPU usage
config.enable_wayland = true   -- Better for Hyprland
config.front_end = "WebGpu"    -- Try hardware acceleration first
config.webgpu_power_preference = "HighPerformance"
config.animation_fps = 1       -- Reduce animation overhead
config.cursor_blink_rate = 800 -- Reduce cursor blink frequency
-- Fix cursor positioning issues
config.line_height = 1.1
config.font_size = 16.0
config.cell_width = 1.0
config.font_shaper = "Harfbuzz"
config.adjust_window_size_when_changing_font_size = false

-- Additional cursor positioning fixes
config.allow_square_glyphs_to_overflow_width = "Never"
config.custom_block_glyphs = false
config.use_cap_height_to_scale_fallback_fonts = false

-- Tab bar height configuration
config.tab_max_width = 32
-- For fancy tab bar (if you enable it), you can also set:
config.window_frame = {
	font = wezterm.font({ family = "JetBrains Mono", weight = "Bold" }),
	font_size = 12,
}

-- Enable kitty graphics and ime for better completion support
config.enable_kitty_graphics = true

config.keys = {

}

config.window_padding = {
	left = 0,
	right = 0,
	top = 2,
	bottom = -1,
}

return config
