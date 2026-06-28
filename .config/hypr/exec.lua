---@module "hl"

hl.on("hyprland.start", function()
    hl.exec_cmd("fcitx5 -d")
    hl.exec_cmd("hyprnotify -s")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hyprpm reload")
    hl.exec_cmd("$HOME/.config/scripts/bright")
    hl.exec_cmd("mullvad-vpn")
    hl.exec_cmd("$HOME/.config/hypr/nuke.sh")

    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("systemctl --user import-environment QT_QPA_PLATFORMTHEME")

    hl.exec_cmd("systemctl --user start hyprpolkitagent")

    hl.exec_cmd("gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg")
end)
