# Rice dots

Disclaimer: currently under construction to run with `ansible`

| System | Software |
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
- `community.general` package from `ansible-galaxy`
- `paru`

Install `git` and `ansible`:
```sh
pacman -S git ansible
```

Install `pacman` and `AUR` for ansible:
```sh
ansible-galaxy collection install community.general
ansible-galaxy collection install kewlfft.aur
```

## Play this ansible playbook

```sh
git clone https://github.com/mrdgo/dots.git /opt/dots && cd /opt/dots
ansible-playbook -i ./hosts ./dotfiles.yml --tags all
```

## Only install my XMonad config

```sh
ansible-playbook -i ./hosts ./dotfiles.yml --tags xmonad
```
