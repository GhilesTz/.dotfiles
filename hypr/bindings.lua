-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
omarchy_preinstalled_bindings = false


-- Free J/K from Omarchy's default bindings
hl.unbind("SUPER + H")
hl.unbind("SUPER + J")
hl.unbind("SUPER + K")
hl.unbind("SUPER + L")


o.bind("SUPER + ALT + H", "Focus on left window", hl.dsp.focus({ direction = "l" }) )
o.bind("SUPER + ALT + L", "Focus on right window", hl.dsp.focus({ direction = "r" }))
o.bind("SUPER + ALT + K", "Focus on above window", hl.dsp.focus({ direction = "u" }))
o.bind("SUPER + ALT + J", "Focus on below window", hl.dsp.focus({ direction = "d" }))

o.bind("SUPER + H", "Focus on left window (group)", hl.dsp.group.prev() )
o.bind("SUPER + L", "Focus on left window (group)", hl.dsp.group.next() )

-- hl.bind("SUPER + Tab", function()
--     hl.dispatch(hl.dsp.window.cycle_next())    -- Change focus to another window
--     hl.dispatch(hl.dsp.window.bring_to_top()) -- Bring it to the top
-- end)
-- 


-- Put the Omarchy functions that J/K used on safer bindings
o.bind("SUPER + CTRL + K", "Show key bindings", "omarchy-menu-keybindings")
o.bind("SUPER + CTRL + J", "Toggle window split", hl.dsp.layout("togglesplit"))


-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")
