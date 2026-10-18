swayimg.text.visible = false
swayimg.text.size = 14

swayimg.on_window_resize(function()
	if (swayimg.mode == "viewer") then
		swayimg.viewer.set_fix_scale("fill")
	end
end)

function set_viewer_awww_wallpaper()
	local img = swayimg.viewer.get_image()
	if img then
		os.execute('awww img -a -t grow "' .. img.path .. '" --transition-pos ' .. positions[math.random(#positions)] .. ' --transition-step 90 --transition-duration .75')
		os.execute('ln -sf "' .. img.path .. '" /tmp/wallpaper')
	end
end

swayimg.viewer.default_scale = "fill"
swayimg.viewer.on_key("w", function() set_viewer_awww_wallpaper() end)
swayimg.viewer.on_key("q", function() swayimg.exit() end)
swayimg.viewer.on_key("j", function() swayimg.viewer.open("next") end)
swayimg.viewer.on_key("h", function() swayimg.viewer.open("next") end)
swayimg.viewer.on_key("space", function() swayimg.viewer.open("next") end)
swayimg.viewer.on_key("k", function() swayimg.viewer.open("prev") end)
swayimg.viewer.on_key("l", function() swayimg.viewer.open("prev") end)
swayimg.viewer.on_key("backspace", function() swayimg.viewer.open("prev") end)
swayimg.viewer.on_key("i", function()
	if(swayimg.text.visible) then
		swayimg.text.visible = false else swayimg.text.visible = true
	end
end)

swayimg.viewer.on_key("f", function()
		swayimg.set_fullscreen(not swayimg.get_fullscreen())
end)

swayimg.viewer.on_key("g", function()
	swayimg.set_mode("gallery")
end)

swayimg.viewer.on_key("tab", function()
	swayimg.set_mode("gallery")
end)

swayimg.gallery.border_size = 1
swayimg.gallery.thumb_size = 300
swayimg.gallery.aspect = "fill"
swayimg.gallery.padding_size = 20
swayimg.gallery.selected_scale = 1
swayimg.gallery.preload = true
swayimg.gallery.selected_color = 0x00000000
swayimg.gallery.unselected_color = 0x00000000
swayimg.gallery.window_color = 0x80000000

positions = {
	"top-left", 
	"top-right", 
	"top", 
	"bottom-left", 
	"bottom-right", 
	"bottom", 
	"left", 
	"right", 
}

function set_gallery_awww_wallpaper()
	local img = swayimg.gallery.get_image()
	if img then
		os.execute('awww img -a -t grow "' .. img.path .. '" --transition-pos ' .. positions[math.random(#positions)] .. ' --transition-step 90 --transition-duration .75')
		os.execute('ln -sf "' .. img.path .. '" /tmp/wallpaper')
		swayimg.set_mode("viewer")
	end
end

swayimg.gallery.on_key("space", function() set_gallery_awww_wallpaper() end)
swayimg.gallery.on_key("return", function() set_gallery_awww_wallpaper() end)
swayimg.gallery.on_mouse("MouseLeft", function() set_gallery_awww_wallpaper() end)

swayimg.gallery.on_key("tab", function()
	swayimg.set_mode("viewer")
end)
