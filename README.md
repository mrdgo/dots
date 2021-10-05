# Dotfiles for xmonad machine

| Key | Value |
|---|---|
| OS | Artix linux |
| Init system | suite66 |

Here you can easily see and reproduce my setup consisting of these components:
- `nvim` setup
- `zsh` setup (mainly aliases)
- `XMonad` window manager config
- `XMobar` top panel config
- `alacritty` terminal emulator config
- `xplr` a tui file explorer/manager
- `moc` music on console setup
- `dunst` notification daemon
- `zathura` minimal pdf viewer
- `picom` compositor for X11
- `starship` shell prompt

## Pre-install

First install requirements:
- `git`
- `ansible`, `ansible-aur`
- `paru`

### Install packages

```sh
pacman -S git ansible
```

### Install paru

```sh
git clone https://aur.archlinux.org/paru-bin.git /opt/paru
cd /opt/paru
sudo makepkg -i
```

Optional:

You can then use `paru` to reinstall itself, so it updates itself on `paru -Syu`.

### Install ansible deps

```sh
paru -S ansible-aur
```

## Play this ansible playbook

```sh
git clone https://github.com/mrdgo/dots.git /opt/dots
cd /opt/dots
ansible-playbook dotfiles.yml
```
