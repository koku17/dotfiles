hl.config ({
	ecosystem = {
		enforce_permissions = false,
	},
})

hl.permission({ binary = "/usr/bin/grim", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/usr/bin/hyprshot", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/usr/bin/wf-recorder", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/usr/bin/hyprlock", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/var/cache/hyprpm/hacker/hyprland-plugins/*", type = "screencopy", mode = "allow" })
