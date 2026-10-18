-- Get Wallpapers
wallpapers = {}
index_i = 1
i_position = {
	"top-left",
	"top-right",
	"bottom-left",
	"bottom-right",
	"top",
	"bottom",
	"left",
	"right"
}

for image in io.popen('find ~/.local/share/wallpapers/Image -type f 2>/dev/null | grep -E "\\.jpg|\\.png|\\.jpeg|\\.webp|\\.gif"'):lines() do
	table.insert(wallpapers, image)
end

index_i = math.random(1, #wallpapers)

hl.on ("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP ; systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	local wallpaper_cmd = "awww img -a -t none /tmp/wallpaper --transition-duration 0.1"
	local wallpaper = wallpapers[index_i]
	hl.exec_cmd("awww-daemon --no-cache & (ln -sf " .. wallpaper .. " /tmp/wallpaper ; " .. wallpaper_cmd .. " ; hyprlock -q ; " .. wallpaper_cmd .. ")") -- for greetd

	-- goodies
	hl.exec_cmd("swaync & disown")
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprsunset -t 4500")

	-- services
	hl.exec_cmd("/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 & hypridle & disown")
	-- hl.exec_cmd("ghostty --gtk-single-instance=true --initial-window=false")
	
	-- daemon
	hl.exec_cmd("nm-applet & blueman-applet")
	hl.exec_cmd("wl-paste -w cliphist -db-path /tmp/cliphist_db store")
	hl.exec_cmd("wl-clip-persist --clipboard regular -w 86400000")

	-- plugins
	hl.exec_cmd("hyprpm reload ; hyprctl eval \"dofile($HOME/.config/hypr/plugin.lua)\"")
end)

hl.on ("config.reloaded",function()
	require("plugin")
end)
