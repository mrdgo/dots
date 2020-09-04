.PHONY: all bash conf xmo

all: bash conf xmo

bash: bashrc bash_aliases bash_profile
	@rm -f ~/.bashrc ~/.bash_aliases ~/.bash_profile
	@ln bashrc ~/.bashrc
	@ln bash_aliases ~/.bash_aliases
	@ln bash_profile ~/.bash_profile

xmo: xmonad/xmonad.hs xinitrc profile
	@rm -f ~/.xinitrc ~/.profile
	@ln profile ~/.profile
	@ln xinitrc ~/.xinitrc
	@mkdir ~/.xmonad
	@cp -lu xmonad/xmonad.hs ~/.xmonad/xmonad.hs

conf: config Xresources inputrc vim moc
	@rm -f ~/.inputrc ~/.Xresources ~/.config ~/.vim ~/.moc
	@ln inputrc ~/.inputrc
	@ln Xresources ~/.Xresources
	@ln -s config/ ~/.config
	@ln -s vim ~/.vim
	@ln -s moc ~/.moc
