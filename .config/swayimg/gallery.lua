swayimg.gallery.on_key("q", function() swayimg.exit() end)
swayimg.gallery.on_key("h", function() swayimg.gallery.switch_image("left") end)
swayimg.gallery.on_key("j", function() swayimg.gallery.switch_image("down") end)
swayimg.gallery.on_key("k", function() swayimg.gallery.switch_image("up") end)
swayimg.gallery.on_key("l", function() swayimg.gallery.switch_image("right") end)
swayimg.gallery.on_key("i", function()
	if(swayimg.text.visible()) then
		swayimg.text.hide() else swayimg.text.show()
	end
end)
	
swayimg.gallery.on_key("f", function()
	swayimg.set_fullscreen(not swayimg.get_fullscreen())
end)

swayimg.gallery.on_key("w", function()
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

	local img = swayimg.gallery.get_image()
	if img then
		os.execute('awww img -a -t grow "' .. img.path .. '" --transition-pos ' .. positions[math.random(#positions)] .. ' --transition-step 90 --transition-duration 1')
		swayimg.set_mode("viewer")
	end
end)
