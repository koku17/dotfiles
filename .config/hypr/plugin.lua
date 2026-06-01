hl.timer(function()
hl.config ({
	plugin = {
		hyprbars = {
			enabled = true,
			bar_color = "rgba(333333B5)",
			bar_height = 25,
			bar_blur = true,
			bar_button_padding = -5,
			on_double_click = "hyprctl dispatch 'hl.dsp.window.fullscreen({ mode = 1 })'",
			bar_buttons_alignment = "left",
			bar_text_size = 14,
			bar_precedence_over_border = false,
			bar_part_of_window = false,
		},
	},
})

hl.plugin.hyprbars.add_button({
    fg_color = "rgba(FF435DBF)",
    bg_color = "rgba(00000000)",
    size = 23,
    icon = "󰅙",
    action = "hyprctl dispatch 'hl.dsp.window.close()'",
})

hl.plugin.hyprbars.add_button({
    bg_color = "rgba(00000000)",
    fg_color = "rgba(BA13CEBF)",
    size = 23,
    icon = "󰐗",
    action = "hyprctl dispatch 'hl.dsp.window.fullscreen({ mode = 1 })'",
})

hl.plugin.hyprbars.add_button({
    bg_color = "rgba(00000000)",
    fg_color = "rgba(00000000)",
		size = 23,
		icon = " ",
		action = ""
})
end, {timeout = 500, type = "oneshot"})
