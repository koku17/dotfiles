swayimg.viewer.set_image_chessboard(10,0xff696969,0xffffffff)
swayimg.viewer.on_key("q", function() swayimg.exit() end)
swayimg.viewer.on_key("j", function() swayimg.viewer.switch_image("next") end)
swayimg.viewer.on_key("space", function() swayimg.viewer.switch_image("next") end)
swayimg.viewer.on_key("k", function() swayimg.viewer.switch_image("prev") end)
swayimg.viewer.on_key("backspace", function() swayimg.viewer.switch_image("prev") end)
swayimg.viewer.on_key("i", function()
	if(swayimg.text.visible()) then
		swayimg.text.hide() else swayimg.text.show()
	end
end)
	
swayimg.viewer.on_key("f", function()
		swayimg.set_fullscreen(not swayimg.get_fullscreen())
end)

swayimg.on_window_resize(function()
	if (swayimg.get_mode() == "viewer") then
		swayimg.viewer.set_fix_scale("height")
	end
end)

swayimg.viewer.on_key("g", function()
	swayimg.set_mode("gallery")
end)

swayimg.viewer.on_key("w", function()
	local positions = {
		"top-left",
		"top-right",
		"top",
		"bottom-left",
		"bottom-right",
		"bottom",
		"left",
		"right",
	}

	local img = swayimg.viewer.get_image()
	if img then
		os.execute('awww img -a -t grow "' .. img.path .. '" --transition-pos ' .. positions[math.random(#positions)] .. ' --transition-step 90 --transition-duration 1')
	end
end)
