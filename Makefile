d=~/dots

bashrc=bashrc
brc=~/.$(bashrc)
brcf=$d/$(bashrc)

$(brc): bashrc
	@rm -f $(brc)
	@ln $(brcf) $(brc)

bashal=bash_aliases
bal=~/.$(bashal)
balf=$d/$(bashal)

$(bal): bash_aliases
	@rm -f $(bal)
	@ln $(balf) $(bal)

inputrc=inputrc
irc=~/.$(inputrc)
ircf=$d/$(inputrc)

$(irc): $(inputrc)
	@rm -f $(irc)
	@ln $(ircf) $(irc)

xres=Xresources
xre=~/.$(xres)
xref=$d/$(xres)

$(xre): $(xref)
	@rm -f $(xre)
	@ln $(xref) $(xre)

conf=config
cnf=~/.$(conf)

$(cnf): $d/config
	@rm -f $(cnf)
	@ln -s $< $(cnf)

~/.vim: $d/vim
	@rm -f ~/.vim
	@ln -s $< ~/.vim

xin=xinitrc
xi=~/.$(xin)
xif=$d/$(xin)

$(xi): $(xif)
	@rm -f $(xi)
	@ln $(xif) $(xi)

bpro=bash_profile
bpr=~/.$(bpro)
bprof=$d/$(bpro)

$(bpr): $(bprof)
	@rm -f $(bpr)
	@ln $(bprof) $(bpr)

pro=profile
pr=~/.$(pro)
prof=$d/$(pro)

$(pr): $(prof)
	@rm -f $(pr)
	@ln $(prof) $(pr)

.PHONY: all bash conf

all: bash conf

bash: $(brc) $(bal) $(bpr)

conf: $(cnf) $(xre) $(xi) ~/.vim $(irc) $(pr)

