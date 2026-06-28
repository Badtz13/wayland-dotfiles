---@module "hl"

hl.env("MOZ_ENABLE_WAYLAND", "1")

hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland,x11,windows")
hl.env("CLUTTER_BACKEND", "wayland")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")

hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

hl.env("QT_IM_MODULE", "fcitx")
hl.env("XMODIFIERS", "@im=fcitx")
hl.env("SDL_IM_MODULE", "fcitx")

hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("HYPRCURSOR_SIZE", "28")
hl.env("XCURSOR_THEME", "BreezeX-RosePine-Linux")
hl.env("XCURSOR_SIZE", "28")

hl.env("FREETYPE_PROPERTIES", "cff:no-stem-darkening=0 autofitter:no-stem-darkening=0")

hl.env("GNUPGHOME", "/home/badtz/.config/.gnupg/")
hl.env("GRADLE_USER_HOME", "/home/badtz/.local/share/gradle")
hl.env("NPM_CONFIG_USERCONFIG", "/home/badtz/.config/npm/npmrc")
hl.env("NUGET_PACKAGES", "/home/badtz/.cache/NuGetPackages")
hl.env("WINEPREFIX", "/home/badtz/.local/share/wineprefixes/default")
