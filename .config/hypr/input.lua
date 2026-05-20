hl.config({
	input = {
		kb_layout = "us,in,in,jp",
		kb_variant = ",kan-kagapa,san-kagapa,kana",
		kb_model = "",
		kb_options = "caps:swapescape,grp:win_space_toggle",
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = 1.0,
		accel_profile = "adaptive",
		repeat_rate = 40,
		repeat_delay = 500,
		numlock_by_default = true,

		touchpad = {
			natural_scroll = true,
			disable_while_typing = true
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
	-- workspace_swipe_distance = 400,
	-- workspace_swipe_min_speed_to_force = 30,
	-- workspace_swipe_create_new = true,
	-- workspace_swipe_cancel_ratio = 0.5,
	-- workspace_swipe_forever = true,
})


-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
	name = "syna32e4:00-06cb:cee7-touchpad",
	disable_while_typing = true,
})
