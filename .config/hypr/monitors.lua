----------------
--- MONITORS ---
----------------

--  See https://wiki.hyprland.org/Configuring/Monitors/
hl.monitor({ output = "eDP-1", mode = "1920x1080@60.00Hz", position = "auto", scale = 1.25})
hl.monitor({ output = "DP-1", mode = "1920x1080@60.00Hz", position = "auto", scale = 1})
hl.monitor({ output = "HDMI-A-1", mode = "highres", position = "auto-left", scale = 1})
hl.monitor({ output = "desc:Acer Technologies XB253Q TH5SI001852L", mode = "1920x1080@239.76Hz", position = "auto-right", scale = 1})
hl.monitor({ output = "desc:Acer Technologies RS272 G0 152200B0C4202", mode = "highres", position = "auto-right", scale = 1})
hl.monitor({ output = "desc:IFP IFP Display", mode = "highres", position = "auto-right", scale = 2})
-- monitor({ output = "desc:IFP IFP Display", mode = "preferred", position = "auto", scale = 1, mirror = "eDP-1"})
-- monitor ({ output = "desc:IFP IFP Display", mode = "highres", position = "auto-right", scale = "1.25", cm = "auto" })
-- monitor ({ output = "desc:Acer Technologies XB253Q TH5SI001852L, scale = "1920x1080@60", position = "auto-right", scale = 1 })
-- monitor ({ output = "desc:Acer Technologies XB253Q TH5SI001852L, scale = "1920x1080@239.76Hz", position = "auto-right", scale = 1 })
-- monitor ({ output = "desc:Acer Technologies XB253Q TH5SI001852L, scale = "1920x1080@60.00Hz", position = "0x0", scale = 1, mirror = "eDP-1" })
-- monitor ({ output = "desc:Acer Technologies XB253Q TH5SI001852L, scale = "highres", position = "auto-right", scale = 2 }) -- 4k 2x scale
-- monitor ({ output = "eDP-1, disabled = true })
-- monitor ({ output = "HDMI-A-1, disabled = true })

--  Internal Display
-- monitor = eDP-1,1920x1080@144.00Hz,auto,1.25
-- monitor = eDP-1, disabled = true })

--  Acer 240hz monitor
-- monitor = desc:Acer Technologies XB253Q TH5SI001852L,3840x2160@59.94Hz,auto-right,1
-- monitor = desc:Acer Technologies XB253Q TH5SI001852L, disabled = true })

--  Class TV display
-- monitor({ output = "desc:IFP IFP Display", mode = "3840x2160@60.00Hz", position = "auto-right", scale = 1 })
-- monitor({ output = "desc:IFP IFP Display", mode = "640x480@59.93Hz", position = "auto-right", scale = 1 })
-- monitor({ output = desc:IFP IFP Display, disabled = true })
