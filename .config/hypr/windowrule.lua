-- Window Rules

-- make all apps float by default
hl.window_rule({
	match = { class = ".*"},
	float = true,
	move = { "cursor_x/2", "(cursor_y/2+25*(1-cursor_y/monitor_h))"}
})

-- Supress maximize request
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- tiled applications
hl.window_rule({
	match = { class = "Alacritty|com.mitchellh.ghostty" },
	tile = true
})

hl.window_rule({
	match = { initial_title = ".* - Chromium" },
	tile = true
})

-- opaque apps
hl.window_rule({
	match = { class = "mpv|swayimg|ffplay|virt-manager|chromium" },
	opaque = true
})

-- full screen apps
hl.window_rule({
	match = { class = "Waydroid|Waydroid(.*)|xonotic-(.*)|supertuxkart|supertux2" },
	fullscreen = true
})

hl.window_rule({
	match = { initial_title = "(.*)(Episode)(.*)(- mpv)" },
	fullscreen = true
})

-- maintain aspect ratio
--hl.window_rule ({
--	match = { class = "mpv" },
--	keep_aspect_ratio = true
--})

-- 0.5 aspect raito
hl.window_rule ({
	match = {
		class = "nemo",
		title = "negative:Select .*|.* Properties|Folder Sharing"
	},
	size = { "monitor_w*0.5", "monitor_h*0.5"}
})

-- 0.75 aspect ratio
hl.window_rule ({
	match = { class = "mpv|swayimg" },
	size = { "0.75*monitor_h*window_w/window_h", "monitor_h*0.75"},
	move = { "cursor_x*(1-0.75*(window_w/window_h)*(monitor_h/monitor_w))", "(1-0.75)*cursor_y+(25*(1-cursor_y/monitor_h))"}
})

-- custom window size
hl.window_rule ({
	match = {
		class = "io.missioncenter.MissionCenter",
		title = "Mission Center"
	},
	min_size = {1110, 570},
})

-- Layer rules
hl.layer_rule({
	match = { namespace = "wofi" },
	dim_around = true,
})

hl.layer_rule({
	match = { namespace = "nwg-dock|wofi|swaync-control-center" },
	ignore_alpha = 0
})

hl.layer_rule({
	match = { namespace = "swaync-control-center" },
	blur = true
})

hl.layer_rule({
	match = { namespace = "nwg-dock|waybar|wofi|logout_dialog|swaync-control-center" },
	blur = true
})

hl.layer_rule({
	match = { namespace = "hyprpicker|selection" },
	no_anim = true
})

-- Xwayland fixes
hl.window_rule({
	name  = "fix-xwayland-drags",
	match = {
		class      = "^$",
		title      = "^$",
		xwayland   = true,
		float      = true,
		fullscreen = false,
		pin        = false,
	},
	no_focus = true,
})

-- wallpaper picker
hl.window_rule({
	match = {
		class = "wallpaper_picker"
	},
	size = { "monitor_w*0.65", "monitor_h*0.65"}
})

-- individual rules
hl.window_rule({
	match = {
		class = "chromium",
		title = "DevTools.*",
		initial_class = "chromium",
		initial_title = "DevTools(.*)"
	},
	size = {"(monitor_w*0.5)", "(monitor_h*0.5)"}
})

hl.window_rule({
	match = { class = "com.mitchellh.ghostty|nemo|auto-cpufreq" },
	opacity = 0.8
})

hl.window_rule({
	match = {
		class = "chromium",
  	title = "Chromium",
  	initial_class = "chromium",
  	initial_title = "Chromium"
	},
	center = true
})

hl.window_rule ({
	match = {
		class = "chromium",
  	initial_class = "chromium",
  	initial_title = "about:blank - Chromium",
	},
	float = true
})
