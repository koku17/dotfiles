local mainMod      = "SUPER"
local terminal     = "alacritty"
local terminal2    = "ghostty"
local fileManager  = "nemo"
local menu         = "pkill wofi || wofi"
local browser      = "chromium"
local waybar_reset = "pkill ^waybar ; waybar &"
local mpvpaper     = 'pkill -9 "^mpvpaper" ; python ~/.scripts/wallpicker.py video'
local wallpaper    =  'pkill -9 "^mpvpaper" || (pkill -f -9 "^swayimg -v --viewer" || swayimg -v --viewer --class=wallpaper_picker -c ~/.config/swayimg/wallpaper.lua ~/.local/share/wallpapers/Custom/*)'
local recorder     = 'wf-recorder --audio="$(pactl get-default-sink).monitor" -r 30 -c hevc_nvenc -p rc=constqp -p qp=20 -p preset=p5 -f "$HOME/Videos/Screen Reocrd/$(date +Record_%d-%m-%Y_%I-%M.mkv)"'
local kill_recorder = "pkill ^wf-recorder"
local notification = "sleep .1 ; swaync-client -t"
local clipboard    = "pkill ^wofi || cliphist -db-path /tmp/cliphist_db list | wofi -S dmenu -r \"echo '%s' | sed 's/^.*\t//' | head -c 50 | tr '\n' ' '\""
local emoji        = 'pkill ^wofi || cat ~/.config/wofi/emojis | wofi -S dmenu -c ~/.config/wofi/emoji'
local run_cmd      = "WOFI_RUN=$(wofi --dmenu) ; [ -n \"$WOFI_RUN\" ] && alacritty -e bash --rcfile ~/.aliases -ic \"$WOFI_RUN ; echo ; read -n 1 -p 'Press any key to Exit ...' wait\""
local lock         = "pidof hyprlock || hyprlock"
local copy_pipe    = " | cliphist -db-path /tmp/cliphist_db decode | wl-copy"
local delete_pipe  = " | cliphist -db-path /tmp/cliphist_db delete"
local pterm_vars   = "HOME=/tmp HISTFILE=/dev/null PS1='\\e[32;01m\\W\\e[0m $ ' "
local pterm_opts   = " -T 'Private Terminal' --config-file ~/.config/alacritty/alacritty.toml --working-directory /tmp -e bash --rcfile ~/.aliases"
local private_term = pterm_vars .. terminal .. pterm_opts
local qr_scanner   = 'ZBARURL="$(zbarimg --raw <(hyprshot -m region -raw) 2> /dev/null)"; [ -n $ZBARURL ] && dunstify -A $ZBARURL,"Copy URL" "QR code detected !" "$ZBARURL" | wl-copy'

-- keycodes
local comma = "code:59"
local dot   = "code:60"
local minus = "code:20"
local equal = "code:21"

-- window binds
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { locked = true, repeating = true })
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.kill(), { locked = true, repeating = true })
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(waybar_reset))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_raw(lock))
hl.bind(mainMod .. " + CTRL + X", hl.dsp.exec_raw("hyprctl dispatch 'hl.dsp.exit()'"))

-- Apps
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_raw(terminal))
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_raw(terminal2))
hl.bind(mainMod .. " + CTRL + RETURN", hl.dsp.exec_cmd(private_term))
hl.bind(mainMod .. " + B", hl.dsp.exec_raw(browser))

-- Shortcuts
hl.bind("ALT + TAB", function()
	hl.dispatch(hl.dsp.window.cycle_next())
	hl.dispatch(hl.dsp.window.alter_zorder({mode = "top"}))
end)

hl.bind("ALT + SHIFT + TAB", function()
		hl.dispatch(hl.dsp.window.cycle_next({next = false}))
	  hl.dispatch(hl.dsp.window.alter_zorder({mode = "top"}))
end)

hl.bind("CTRL + ALT + DELETE", hl.dsp.exec_cmd("pkill ^wlogout || timeout 10 wlogout -l ~/.config/wlogout/hyprland -n -b 6 -m 350"))
hl.bind("CTRL + SHIFT + ESCAPE", hl.dsp.exec_cmd("GTK_THEME= missioncenter"))
hl.bind(mainMod .. " + E", hl.dsp.exec_raw(fileManager))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(wallpaper))
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.exec_cmd(mpvpaper))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + T", hl.dsp.layout("togglesplit"))

-- launcher menu
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd(run_cmd))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(notification))
hl.bind(mainMod .. " + " .. comma, hl.dsp.exec_cmd(clipboard .. copy_pipe))
hl.bind(mainMod .. " + SHIFT + " .. comma, hl.dsp.exec_cmd(clipboard .. delete_pipe))
hl.bind(mainMod .. " + CTRL + " .. comma, hl.dsp.exec_cmd("pkill ^wofi ; cliphist -db-path /tmp/cliphist_db wipe"))
hl.bind(mainMod .. " + " .. dot, hl.dsp.exec_cmd(emoji .. "| cut -d \" \" -f 1 | tr '\n' ' ' | sed 's/ //g' | wl-copy"))

-- Lock screen
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("pidof hyprlock || hyprlock --immediate-render"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left"  }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up"    }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down"  }))

-- Screenshot and Screen Recording
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -s -m output -m active -o ~/Pictures -f $(date +ScreenShot_%d-%m-%Y_%I:%M:%S.png)"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_raw("hyprshot -s -m region --clipboard-only"))
hl.bind("CTRL + PRINT", hl.dsp.exec_raw("hyprshot -s -m window --clipboard-only"))
hl.bind("CTRL + SHIFT + PRINT", hl.dsp.exec_raw("hyprshot -z -s -m region --clipboard-only"))
hl.bind("ALT + PRINT", hl.dsp.exec_cmd(qr_scanner))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd(recorder))
hl.bind(mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd(kill_recorder))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 9 do
	  hl.bind(mainMod .. " + " .. i,         hl.dsp.focus({ workspace = i}))
	  hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
--hl.timer(function()
hl.bind(mainMod .. " + SHIFT + 0", function()
	local active_workspace = hl.get_active_workspace()
	hl.dispatch(hl.dsp.window.move({ workspace = active_workspace }))
end)
--end,{timeout = 1, type = "oneshot"})
--hl.bind(mainMod .. " + CTRL + 0", {zoom_factor = 0, mode = "mult"})

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + SHIFT + mouse_down", hl.dsp.focus({ workspace = "r-1" }))
hl.bind(mainMod .. " + SHIFT + mouse_up",   hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mainMod .. " + CTRL + mouse_down", hl.dsp.window.move({ workspace = "r-1" }), { mouse = true})
hl.bind(mainMod .. " + CTRL + mouse_up",   hl.dsp.window.move({ workspace = "r+1" }), { mouse = true})
hl.bind(mainMod .. " + CTRL + SHIFT + mouse_down", hl.dsp.window.move({ workspace = "e-1" }), { mouse = true})
hl.bind(mainMod .. " + CTRL + SHIFT + mouse_up",   hl.dsp.window.move({ workspace = "e+1" }), { mouse = true})
hl.bind(mainMod .. " + SHIFT + " .. equal, hl.dsp.focus({ workspace = "r+1" }), {locked = true, repeating = true})
hl.bind(mainMod .. " + SHIFT + " .. minus, hl.dsp.focus({ workspace = "r-1" }), {locked = true, repeating = true})
hl.bind(mainMod .. " + " .. equal, hl.dsp.focus({ workspace = "m+1" }), {locked = true, repeating = true})
hl.bind(mainMod .. " + " .. minus, hl.dsp.focus({ workspace = "m-1" }), {locked = true, repeating = true})
hl.bind(mainMod .. " + CTRL + " .. equal, hl.dsp.window.move({ workspace = "r+1" }), {repeating = true})
hl.bind(mainMod .. " + CTRL + " .. minus, hl.dsp.window.move({ workspace = "r-1" }), {repeating = true})
hl.bind(mainMod .. " + CTRL + SHIFT + " .. equal, hl.dsp.window.move({ workspace = "m+1" }), {repeating = true})
hl.bind(mainMod .. " + CTRL + SHIFT + " .. minus, hl.dsp.window.move({ workspace = "m-1" }), {repeating = true})

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })

local focused_keep_aspect = hl.window_rule({
    match = { focus = true },
    keep_aspect_ratio = true,
})

hl.bind(mainMod .. " + SHIFT + mouse:273",function()
	focused_keep_aspect:set_enabled(true)
	hl.dispatch(hl.dsp.window.resize())
end, { mouse = true })

hl.bind(mainMod .. " + SHIFT + mouse:273",function()
	focused_keep_aspect:set_enabled(false)
end, { mouse = true, release = true })

hl.bind(mainMod .. " + mouse:273",function()
	focused_keep_aspect:set_enabled(false)
	hl.dispatch(hl.dsp.window.resize())
end, { mouse = true })

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
local audio_change = "paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga"
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_raw("pamixer -i 5 ; " .. audio_change),          { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_raw("pamixer -d 5 ; " .. audio_change),          { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_raw("pamixer --toggle-mute ; " .. audio_change), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_raw("brightnessctl set 5%+"),                    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_raw("brightnessctl set 5%-"),                    { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"),                                  { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl --all-players play-pause"),              { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"),                              { locked = true })
hl.bind("XF86Calculator", hl.dsp.exec_raw("pidof qalculate-gtk || qalculate-gtk"),           { locked = true })
hl.bind("XF86Launch2", hl.dsp.exec_raw("lutris"),                                            { locked = true })

-- Laptop Lid
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("(hyprctl dispatch 'hl.dsp.dpms({action = \"disabled\"})' ; pidof hyprlock || hyprlock)"))
--hl.bind("switch:on:Lid Switch",function()
--	hl.timer(function()
--			hl.dispatch(hl.dsp.dpms({action = "enabled"}))
--	end, {timeout = 1000, type = "oneshot"})
--end)
