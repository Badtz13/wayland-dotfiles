---@module "hl"

local opaque_classes = {
    "kitty",
    "firefox",
    "librewolf",
    "^(Gimp)$",
    "^(feh)$",
    "^(mpv)$",
    "^(zoom)$",
    "^(Discord Popout)$",
    "^(anki)$",
    "^(overwatch.exe)$",
    "^(starrail.exe)$",
    "^(Beatblock)$",
    "^(jetbrains-studio)$",
    "^(python3)$",
    "^(retroarch)$",
}

for _, class in ipairs(opaque_classes) do
    hl.window_rule({
        match = { class = class },
        opacity = "1.0 override",
    })
end

hl.window_rule({
    match = { class = "^(vesktop)$" },
    opacity = "0.9 override",
})

hl.window_rule({
    match = { title = "^(The Honkers Railway Launcher)$" },
    opacity = "0.9 override",
})

hl.window_rule({
    match = { class = "^(anki)$" },
    float = true,
    size = { "50%", "80%" },
    center = true,
})

hl.window_rule({
    match = { class = "^(lutris)$" },
    tile = true,
    workspace = "4",
})

hl.window_rule({
    match = { class = "^(drun)$" },
    float = true,
    size = { "30%", "30%" },
    center = true,
})

hl.window_rule({
    match = { title = "^(.*Bitwarden.*)$" },
    float = true,
})

hl.window_rule({
    match = { class = "^(overwatch.exe)$" },
    fullscreen = true,
    immediate = true,
})

hl.window_rule({
    match = { class = "^(steam_app_2073850)$" },
    fullscreen = true,
    immediate = true,
    fullscreen_state = "3 3",
    allows_input = true,
})

hl.window_rule({
    match = { class = "^(Starrail.exe)$" },
    immediate = true,
    render_unfocused = true,
})

hl.window_rule({
    match = { title = "^(The Honkers Railway Launcher)$" },
    float = true,
    center = true,
    size = { "60%", "60%" },
    border_size = 2,
    rounding = 16,
    decorate = true,
    workspace = "4",
})

hl.window_rule({
    match = { class = "^(steam)$" },
    stay_focused = true,
    min_size = { 1, 1 },
})

hl.window_rule({
    match = { class = "^(Spotify)$" },
    workspace = "2",
})

hl.window_rule({
    match = { class = "^(discord)$" },
    workspace = "5",
})

hl.window_rule({
    match = { class = "^(vesktop)$" },
    workspace = "5",
})

hl.window_rule({
    match = { class = "^(Beeper)$" },
    workspace = "5",
})

hl.window_rule({
    match = { class = "^(signal beta)$" },
    workspace = "5",
})

hl.window_rule({
    match = { class = "^(track)$" },
    workspace = "5",
    size = { "50%", "10%" },
})

hl.window_rule({
    match = { class = "^(Mullvad VPN)$" },
    workspace = "6",
})

hl.window_rule({
    match = { class = "^(Minecraft)$" },
    float = true,
})

hl.window_rule({
    match = { title = "^(File Operation Progress)$" },
    float = true,
})

hl.layer_rule({
    match = { namespace = "launcher" },
    blur = true,
})

hl.layer_rule({
    match = { namespace = "notifications" },
    blur = true,
})
