-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")
--
-- ===================================================================
-- Custom bindings
-- ===================================================================

-- ===================================================================
-- Unbind Omarchy defaults (must come before rebinding the same keys)
-- ===================================================================
hl.unbind("SUPER + J")
hl.unbind("SUPER + H")
hl.unbind("SUPER + K")
hl.unbind("SUPER + L")
hl.unbind("SUPER + Q")
hl.unbind("SUPER + SPACE")
hl.unbind("SUPER + SHIFT + RETURN")
hl.unbind("Super + ALT + F")
hl.unbind("Super + M")
hl.unbind("Super + SHIFT + SPACE")
hl.unbind("SUPER + B")
hl.unbind("SUPER + TAB")
hl.unbind("SUPER + P")

hl.unbind("F1")
hl.unbind("F2")
hl.unbind("F3")
hl.unbind("F5")
hl.unbind("F6")

-- ===================================================================
-- Media keys — Volume
-- ===================================================================
o.bind("F3", "Volume up",   "omarchy-audio-output-volume raise",  { locked = true, repeating = true })
o.bind("F2", "Volume down", "omarchy-audio-output-volume lower",  { locked = true, repeating = true })
o.bind("F1", "Volume mute", "omarchy-audio-output-volume mute-toggle", { locked = true })

-- ===================================================================
-- Media keys — Brightness
-- ===================================================================
o.bind("F6", "Brightness up",   "omarchy-brightness-display +5%", { locked = true, repeating = true })
o.bind("F5", "Brightness down", "omarchy-brightness-display 5%-", { locked = true, repeating = true })

-- ===================================================================
-- Window state (fullscreen / floating / bar)
-- ===================================================================
hl.bind("SUPER + M", hl.dsp.window.fullscreen({ mode = 1 }), { description = "Fullscreen with bar" })
hl.bind("SUPER + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })
o.bind("SUPER + B", "toggle bar for omarchy", "omarchy toggle bar")

-- ===================================================================
-- Window behaviour (close / master-swap / mfact)
-- ===================================================================
hl.bind("SUPER + SHIFT + RETURN", hl.dsp.layout("swapwithmaster master"), { description = "Swap Master" })
hl.bind("SUPER + Q", hl.dsp.window.close(), { repeating = true , description = "Close Window" })
hl.bind("SUPER + H", hl.dsp.layout("mfact -0.05"), { repeating = true, description = "Decrease mfact" }) -- (default super + -)
hl.bind("SUPER + L", hl.dsp.layout("mfact +0.05"), { repeating = true, description = "Increase mfact" }) -- (default super + =)

-- hl.bind("SUPER + SHIFT + I", hl.dsp.layout("addmaster"),    { description = "Increase nmaster" })
-- hl.bind("SUPER + SHIFT + D", hl.dsp.layout("removemaster"), { description = "Decrease nmaster" })

-- ===================================================================
-- Navigation (focus / workspace cycling)
-- ===================================================================
hl.bind("SUPER + J", hl.dsp.layout("cyclenext"), { repeating= true , description = "Focus next in stack" })
hl.bind("SUPER + K", hl.dsp.layout("cycleprev"), { repeating= true, description = "Focus previous in stack" })
o.bind("SUPER + TAB", "Cycle recent workspace", hl.dsp.focus({ workspace = "previous" }))

-- ===================================================================
-- Omarchy-specific & personal bindings
-- ===================================================================
o.bind("SUPER + I", "Omarchy menu", "omarchy-menu toggle root")
o.bind("SUPER + SHIFT + K", "Show Keybindings", "omarchy-menu-keybindings")
o.bind("F4", "Opening file manager", "foot -e ranger ~/Documents/School")
o.bind("SUPER + P", "Opening private firefox window", "firefox --private-window --new-tab")
