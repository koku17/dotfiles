-- Window Rules

-- make all apps float by default
hl.window_rule({
	match = { class = ".*"},
	float = true,
	--move = { "cursor_x/2", "(cursor_y/2+25*(1-cursor_y/monitor_h))"}
})

-- Supress maximize request
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- tiled applications
hl.window_rule({
	match = {
		class = "Alacritty|com.mitchellh.ghostty",
	},
	tile = true
})

hl.window_rule({
	match = {
		initial_title = ".* - Chromium",
	},
	tile = true
})

-- opacity 0.8 apps
hl.window_rule({
	match = { class = "com.mitchellh.ghostty|nemo"},
	opacity = 0.8
})

-- opaque apps
hl.window_rule({
	match = { class = "mpv|swayimg|ffplay|virt-manager|chromium"},
	opaque = true
})

-- full screen apps
hl.window_rule({
	match = {
		class = "Waydroid|Waydroid(.*)"
	},
	fullscreen = true
})

hl.window_rule({
	match = {
		initial_title = "(.*)(Episode)(.*)(- mpv)",
	},
	fullscreen = true
})

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

-- Layer rules
hl.layer_rule({
	match = { namespace = "wofi" },
	dim_around = true,
})

hl.layer_rule({
	match = { namespace = "nwg-dock|wofi" },
	ignore_alpha = 0
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
