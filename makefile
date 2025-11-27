config:
	@cp -r .config/*/ ~/.config
	@cp -r .*/ ~

update:
	@cp -r ~/.{gnome2,scripts} .
	@cp -r ~/.config/{alacritty,ghostty,hypr,kitty,mpv,swayimg,waybar,wlogout,wofi,zathura}/ .config
