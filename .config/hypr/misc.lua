hl.config({
	misc = {
		enable_swallow = true,
		disable_hyprland_logo = true,
		force_default_wallpaper = -1,
		disable_splash_rendering = true,
		vrr = 0,
		key_press_enables_dpms = true,
		mouse_move_enables_dpms = true,
		middle_click_paste = true,
		always_follow_on_dnd = true,
		--layers_hog_keyboard_focus = true,
		--animate_manual_resizes = false,
		animate_mouse_windowdragging = false,
		close_special_on_empty = true,
		enable_anr_dialog = true,
		anr_missed_pings = 5
	},
	opengl = { nvidia_anti_flicker = true },
	 render = {
	 	-- new_render_scheduling = true
		expand_undersized_textures = true,
	 },
	cursor = {
		sync_gsettings_theme = true,
		no_hardware_cursors = true
	},
	debug = {
		damage_blink = false,
		vfr = false,
	}
})
