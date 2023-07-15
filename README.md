# dotfiles

Alternative dotfiles

- Catppuccin-mocha colorscheme
- dwm bindings
- GTK3, QT5 and QT6 (qt5ct, qt6ct, kvantum)
- Alacritty
- Sway
- Waybar
- Swaync
- dmenu
- wofi
- xdg-desktop-portal-wlr

![Image](https://cdn.discordapp.com/attachments/1022481644633997373/1124052096740765878/image.png)

## Credits

- [Catppuccin](https://github.com/catppuccin)
- [baolhq - Catppuccin Sway](https://github.com/baolhq/catppuccin-sway)
- [chaibronz' waybar config](https://github.com/chaibronz/waybar_conf)

## Dependencies

This project requires a patched sway version, you can install my patches with the AUR package `sway-afy-git`, or you can patch it yourself.  
[Patches](https://gitlab.com/alifurkany/sway-patches)

This project also requires you to patch dmenu with the [line height patch](https://tools.suckless.org/dmenu/patches/line-height/).

- catppuccin-gtk-theme-mocha
- dex
- dmenu
- glib2
- grim
- kvantum
- kvantum-theme-catppuccin-git
- libnotify
- libpulse
- lxqt-policykit
- networkmanager
- pavucontrol-qt
- pipewire
- pipewire-pulse
- playerctl
- qt5ct
- qt6ct
- slurp
- sway-afy-git
- sway-systemd
- swayidle
- swaylock
- swaynagmode
- swaync
- systemd
- ttf-hack
- ttf-hack-nerd
- waybar
- wireplumber
- wl-clipboard
- wofi
- xdg-desktop-portal
- xdg-desktop-portal-wlr
- xdg-user-dirs
- xorg-xrandr

### Optional dependencies

Without the dependencies above, stuff may break but these ones are not required.

- light (For backlight control)
- pamixer (Getting microphone volume)

## Notes

Note: The -git version of `sway-systemd` has weird autostart functionality by default.

Note: You need to configure `.config/xdg-desktop-portal-wlr/config` for your setup.

Note: The project `obs-savereplay` is not included in this repository. You need to write it yourself if you want to use it.
