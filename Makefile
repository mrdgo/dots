.PHONY: all bash conf xmo

all: bash conf xmo

bash: bashrc bash_aliases bash_profile
	@rm -f ~/.bashrc ~/.bash_aliases ~/.bash_profile
	@ln /opt/dots/bashrc ~/.bashrc
	@ln /opt/dots/bash_aliases ~/.bash_aliases
	@ln /opt/dots/bash_profile ~/.bash_profile

xmo: xmonad/xmonad.hs xinitrc profile
	@rm -rf ~/.xinitrc ~/.profile ~/.xmonad
	@ln /opt/dots/profile ~/.profile
	@ln /opt/dots/xinitrc ~/.xinitrc
	@mkdir ~/.xmonad
	@cp -lu /opt/dots/xmonad/xmonad.hs ~/.xmonad/xmonad.hs

conf: config Xresources inputrc vim moc
	@rm -f ~/.inputrc ~/.Xresources ~/.config ~/.vim ~/.moc
	@ln /opt/dots/inputrc ~/.inputrc
	@ln /opt/dots/Xresources ~/.Xresources
	@ln -s /opt/dots/config/ ~/.config
	@ln -s /opt/dots/vim ~/.vim
	@ln -s /opt/dots/moc ~/.moc
