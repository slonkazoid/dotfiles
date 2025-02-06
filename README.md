# dotfiles

My dotfiles

- Catppuccin Mocha color scheme
- dwm-like bindings
- alacritty
- sway
- waybar
- swaync
- dmenu
- wofi

![picture of a sway catppuccin rice. several terminal windows open, featuring neovim, neofetch, git, w3m, and such. the OS is arch linux](https://files.slonk.ing/1mPvlELB.Screenshot_20240903_192112.png)

## Credits

- [Catppuccin](https://github.com/catppuccin)
- [baolhq - Catppuccin Sway](https://github.com/baolhq/catppuccin-sway)
- [chaibronz' waybar config](https://github.com/chaibronz/waybar_conf)

## Dependencies

Note: You need to install patched versions of sway and dmenu. You can find PKGBUILDs for them by following the links.

- catppuccin-gtk-theme-mocha
- catppuccin-kde-theme
- dex
- [dmenu](https://gitlab.com/slonkazoid/pkgbuild-dmenu-patched)
- glib2
- grim
- libnotify
- libpulse
- lxqt-policykit
- networkmanager
- pavucontrol
- pipewire
- pipewire-pulse
- playerctl
- qt5ct
- slurp
- [sway-slonk-git](https://gitlab.com/slonkazoid/pkgbuild-sway-slonk-git)
- swayidle
- swaylock
- swaync
- systemd
- ttf-hack
- waybar
- wireplumber
- wl-clipboard
- wofi
- wpctl
- xdg-desktop-portal
- xdg-desktop-portal-wlr
- xdg-user-dirs
- xorg-xrandr

### AUR dependencies

- sway-systemd
- swaynagmode

### Optional dependencies

- light (For backlight control)
- feh (For the freeze mode of screenshot.sh)
- kolourpaint (For kolourpaint.sh)

## Notes

Note: The `.config/fontconfig/fonts.conf` file is tuned for VA panels. You probably want to create a new one with qt5ct.

Note: You need to configure `.config/xdg-desktop-portal-wlr/config` for your setup.

Note: The project `obs-savereplay` is not included in this repository. You need to write it yourself if you want to use it.
