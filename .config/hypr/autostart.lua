hl.on ("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("awww-daemon --no-cache & ( sleep .5 ; python ~/.scripts/wallpicker.py image)")

	-- goodies
	hl.exec_cmd("swaync")
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
	hl.exec_cmd("hyprpm reload")
end)
