plugin:
	@hyprpm update
	@hyprpm add https://github.com/hyprwm/hyprland-plugins
	@hyprpm enable hyprbars hyprexpo 

config: plugin
	@cp -r .config/*/ ~/.config
	@cp -r .*/ ~

update:
	@cp -r ~/.{gnome2,scripts} .
	@cp -r ~/.config/{alacritty,ghostty,hypr,mpv,swayimg,waybar,wlogout,wofi,zathura}/ .config

push:
	@git add .
	@git commit -m "$$(date +%c)"
	@git push -u origin main
