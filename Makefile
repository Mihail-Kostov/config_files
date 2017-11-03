.PHONY: bash chrome i3 xorg zsh

all: bash chrome git i3 xorg zsh

remove_all: remove_bash remove_chrome remove_git remove_i3 remove_xorg remove_zsh

bash: $@
	ln -rs $@/.[!.]* ~

remove_bash:
	rm -f ~/.bash{rc,_profile}

chrome: $@
	mkdir -p ~/.config
	ln -rs $@/* ~/.config

remove_chrome:
	rm -f ~/.config/chrome-flags.conf

git: .gitconfig
	ln -rs $< ~/.gitconfig

remove_git:
	rm -f ~/.gitconfig

i3: $@
	mkdir -p ~/.config
	ln -rs $@/* ~/.config

remove_i3:
	rm -f ~/.config/i3{,status}

xorg: $@
	ln -rs $@/.[!.]* ~

remove_xorg:
	rm -f ~/.{xinitrc,xserverrc,Xresources{,.d}}

zsh: $@
	ln -rs $@/.[!.]* ~

remove_zsh:
	rm -f ~/.{zprofile,zshrc}

systemwide: nftables sysctl

remove_systemwide: remove_nftables remove_sysctl

nftables: .nftables
	sudo ln -rs $< /etc/nftables.conf

remove_nftables:
	sudo rm -f /etc/nftables.conf

sysctl: .sysctl
	sudo ln -rs $< /etc/sysctl.d/99-sysctl.conf

remove_sysctl:
	sudo rm -f /etc/sysctl.d/99-sysctl.conf
