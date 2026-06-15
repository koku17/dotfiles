hl.on ("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP ; systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	local wallpaper = io.popen('mlocate ~/.local/share/wallpapers/Image 2>/dev/null | grep -E "\\.png|\\.jpg|\\.jpeg|\\.webp|\\.gif" | shuf -n 1'):read("*l")
	local wallpaper_cmd = "awww img -a -t none /tmp/wallpaper --transition-duration 0.01"
	--local wallpaper_cmd = "awww img -a -t grow /tmp/wallpaper --transition-pos top-left --transition-step 90 --transition-duration 1"
	hl.exec_cmd("awww-daemon --no-cache & (ln -sf " .. wallpaper .. " /tmp/wallpaper ; " .. wallpaper_cmd .. " ; hyprlock ; " .. wallpaper_cmd .. ")") -- for greetd
	-- hl.exec_cmd("awww-daemon --no-cache & (" .. wallpaper_cmd .. ")") -- for sddm

	-- goodies
	hl.exec_cmd("sleep .1 ; swaync")
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprsunset -t 4500")

	-- services
	hl.exec_cmd("(sleep 1 ; systemctl start --user hyprpolkitagent ; hypridle)")
	-- hl.exec_cmd("ghostty --gtk-single-instance=true --initial-window=false")
	
	-- daemon
	hl.exec_cmd("nm-applet & blueman-applet")
	hl.exec_cmd("wl-paste -w cliphist -db-path /tmp/cliphist_db store")
	hl.exec_cmd("wl-clip-persist --clipboard regular -w 86400000")

	-- plugins
	hl.exec_cmd("hyprpm reload ; hyprctl eval \"$(cat $HOME/.config/hypr/plugin.lua)\"")
end)
