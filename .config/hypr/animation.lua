hl.config({
    general = {
        gaps_in  = 3,
        gaps_out = 6,

        border_size = 0,

        col = {
            active_border   = { colors = {"rgba(ffffffa0)", "rgba(000000a0)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding       = 7,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 0.7,

        shadow = {
            enabled      = false,
            range        = 0,
            render_power = 0,
            color        = 0x000000ff,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 2,
						popups = true,
						popups_ignorealpha = 0.8,
						ignore_opacity = false,
						special = true,
						new_optimizations = true,
            vibrancy  = 0.15,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.curve("expressiveFastSpatial", { type = "bezier", points = { {0.42, 1.67}, {0.21, 0.90} }})
hl.curve("expressiveSlowSpatial", { type = "bezier", points = { {0.39, 1.29}, {0.35, 0.98} }})
hl.curve("expressiveDefaultSpatial", { type = "bezier", points = { {0.38, 1.21}, {0.22, 1.00} }})
hl.curve("emphasizedDecel", { type = "bezier", points = { {0.05, 0.7}, {0.1, 1} }})
hl.curve("emphasizedAccel", { type = "bezier", points = { {0.3, 0}, {0.8, 0.15} }})
hl.curve("standardDecel", { type = "bezier", points = { {0, 0}, {0, 1} }})
hl.curve("menu_decel", { type = "bezier", points = { { 0.1, 1}, {0, 1} }})
hl.curve("menu_accel", { type = "bezier", points = { { 0.52, 0.03}, {0.72, 0.08} }})

-- windows
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "emphasizedDecel", style = "popin 80%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2, bezier = "emphasizedDecel", style = "popin 90%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3, bezier = "emphasizedDecel", style = "slide" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "emphasizedDecel" })

-- layers
hl.animation({ leaf = "layersIn", enabled = true, speed = 2.7, bezier = "emphasizedDecel", style = "popin 93%" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 2.4, bezier = "menu_accel", style = "popin 94%" })

-- fade
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 0.5, bezier = "menu_decel" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 2.7, bezier = "menu_accel" })

-- workspaces
hl.animation({ leaf = "workspaces", enabled = true, speed = 7, bezier = "menu_decel", style = "slide" })

-- specialWorkspace
hl.animation({ leaf = "specialWorkspaceIn", enabled = true, speed = 2.8, bezier = "emphasizedDecel", style = "slidevert" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 1.2, bezier = "emphasizedAccel", style = "slidevert" })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})
