.PHONY: all bash conf xmo

all: zsh conf xmo

ubuntu: zsh conf
	sudo add-apt-repository ppa:neovim-ppa/unstable
	sudo apt install -y neovim tmux git zsh
	sh -c "$(curl -fsSL https://starship.rs/install.sh)"
	sudo chsh maxim -s $(which zsh)

zsh: zshrc zshenv zprofile aliases
	@rm -f ~/.zshrc ~/.zprofile ~/.zshenv ~/.aliases
	@ln /opt/dots/aliases ~/.aliases
	@ln /opt/dots/zshrc ~/.zshrc
	@ln /opt/dots/zshenv ~/.zshenv
	@ln /opt/dots/zprofile ~/.zprofile

bash: bashrc aliases bash_profile profile inputrc
	@rm -f ~/.inputrc ~/.bashrc ~/.profile ~/.bash_aliases ~/.bash_profile
	@ln /opt/dots/profile ~/.profile
	@ln /opt/dots/inputrc ~/.inputrc
	@ln /opt/dots/bashrc ~/.bashrc
	@ln /opt/dots/aliases ~/.aliases
	@ln /opt/dots/bash_profile ~/.bash_profile

xmo: xmonad/xmonad.hs xinitrc
	@rm -rf ~/.xinitrc ~/.xmonad
	@ln /opt/dots/xinitrc ~/.xinitrc
	@mkdir ~/.xmonad
	@cp -lu /opt/dots/xmonad/xmonad.hs ~/.xmonad/xmonad.hs

conf: config Xresources moc
	@rm -f ~/.Xresources ~/.config ~/.moc
	@ln /opt/dots/Xresources ~/.Xresources
	@ln -s /opt/dots/config/ ~/.config
	@ln -s /opt/dots/moc ~/.moc
