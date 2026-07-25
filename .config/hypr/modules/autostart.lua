hl.on("hyprland.start", function()
    
	hl.exec_cmd("awww-daemon")

	hl.exec_cmd("waybar")

	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")

	hl.exec_cmd("swaync")

    hl.exec_cmd("systemctl --user start hyprpolkitagent")
	
end)
