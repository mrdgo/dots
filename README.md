# Rice dots

Here you can easily reproduce my setup consisting of these components:
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
- `suite66` init system (nothing to to see here, yet)

## Pre-install

First install requirements:
- `git`
- `ansible`
- `community.general` and `kewlfft.aur` package from `ansible-galaxy`

Install `git` and `ansible`:
```sh
pacman -S git ansible
```

Install `pacman` and `AUR` for ansible:
```sh
ansible-galaxy collection install community.general
ansible-galaxy collection install kewlfft.aur
```

## Install all components

```sh
git clone https://github.com/mrdgo/dots.git /opt/dots && cd /opt/dots
ansible-playbook -i ./hosts ./dotfiles.yml --tags all
```

## Install single components

```sh
ansible-playbook -i ./hosts ./dotfiles.yml --tags TAG
```

For `TAG` in the list of tags in `dotfiles.yml`.
`i3` and `bash` exist but are unmaintained.
