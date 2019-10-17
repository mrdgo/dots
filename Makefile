d=~/github/dotfiles

bashrc=bashrc
bashal=bash_aliases
inputrc=inputrc
conf=config
xres=Xresources

brc=~/.$(bashrc)
brcf=$d/$(bashrc)

bal=~/.$(bashal)
balf=$d/$(bashal)

irc=~/.$(inputrc)
ircf=$d/$(inputrc)

xre=~/.$(xres)
xref=$d/$(xres)

cnf=~/.$(conf)

.PHONY: all bash conf

all: bash conf

bash: $(brc) $(bal) $(irc)

conf: $(cnf) $(xre)

$(brc): bashrc
	@rm -f $(brc)
	@ln $(brcf) $(brc)

$(bal): bash_aliases
	@rm -f $(bal)
	@ln $(balf) $(bal)

$(irc): $(inputrc)
	@rm -f $(irc)
	@ln $(ircf) $(irc)

$(xre): $(xref)
	@rm -f $(xre)
	@ln $(xref) $(xre)

$(cnf): $d/config
	@rm -f $(cnf)
	@ln -s $< $(cnf)

~/.vim: $d/vim
	rm -f ~/.vim
	ln -s $< ~/.vim
