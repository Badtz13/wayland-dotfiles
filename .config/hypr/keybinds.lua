---@module "hl"

local mainMod = "SUPER"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("kitty"))

hl.bind(mainMod .. " + SHIFT + Return",
    hl.dsp.exec_cmd(
        "tofi-run -c /home/badtz/.config/tofi/config --include /home/badtz/.cache/wal/colors-tofi.conf | sh"
    ))

hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + ALT + Q", hl.dsp.exit())
hl.bind(mainMod .. " + ALT + R", hl.dsp.exec_cmd("hyprctl reload && notify-send 'Hyprland' 'reloaded'"))
hl.bind(mainMod .. " + S", hl.dsp.window.float())
hl.bind(mainMod .. " + T", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

hl.bind(mainMod .. " + SHIFT + X", hl.dsp.exec_cmd("grimblast --freeze copy area"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("notify-send 'Picked color:' \"$(hyprpicker -a)\""))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("rec"))
hl.bind(mainMod .. " + b", hl.dsp.exec_cmd("swapsink"))
hl.bind(mainMod .. " + n", hl.dsp.exec_cmd("dunsttoggle"))
hl.bind(mainMod .. " + w", hl.dsp.exec_cmd("$HOME/.config/hypr/theme.sh random"))

hl.bind(mainMod .. " + m", hl.dsp.workspace.toggle_special("music"))
hl.bind(mainMod .. " + v", hl.dsp.workspace.toggle_special("volume"))
hl.bind(mainMod .. " + a", hl.dsp.workspace.toggle_special("anki"))
hl.bind(mainMod .. " + o", hl.dsp.workspace.toggle_special("info"))

hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + i", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + i", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.swap({ direction = "down" }))

for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
end

for i = 1, 8 do
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + bracketleft", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + bracketright", hl.dsp.focus({ workspace = "e+1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
