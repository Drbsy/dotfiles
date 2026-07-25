

# Important Known Issues

1. These dotfiles aren't compatible with various screen resolutions and scales. My setup is 2K `2560x1440` with a 1.25 scale. You need to adjust the settings to make them work (working on a fix).
2. You might find missing required packages; just submit an issue on the GitHub page, and they will be added.
3. This version of the dotfiles is just a preview.

# Instillation

 1.  Clone the repo:

	 `git clone https://github.com/Drbsy/dotfiles.git`

2.  Install required packages:
	
	   ` sudo pacman -S hyprland hyprlock kitty yazi python-pywal awww rofi-wayland waybar fastfetch swaync hyprpolkitagent wl-clipboard cliphist nm-connection-editor blueman pavucontrol playerctl ttf-jetbrains-mono-nerd zsh`
	   
	   `yay -S hyprshot whitesur-icon-theme ttf-feather ttf-feather zsh-theme-powerlevel10k-git`
3. Applay dotfiles:
	 
	1. Backup your old dotfiles.
	2. Copy the  `.dotfiles` content  to  `~/.config` and `Pictures` folder to `~/` (home).
	3. Make zsh default shell `chsh -s /usr/bin/zsh`.
	4. Configure p10k `p10k configure`.
	5. reboot your machine.

	   



## Preview

<video src="https://github.com/user-attachments/assets/a5e416c6-4529-4c41-93d5-395cde248a11" controls muted width="100%"></video>

---

## Screenshots


<table>
  <tr>
    <td><img src="https://raw.githubusercontent.com/Drbsy/dotfiles/main/preview/screenshot.png" width="100%"></td>
    <td><img src="https://raw.githubusercontent.com/Drbsy/dotfiles/main/preview/screenshot.png" width="100%"></td>
    <td><img src="https://raw.githubusercontent.com/Drbsy/dotfiles/main/preview/screenshot-1.png" width="100%"></td>
  </tr>
  <tr>
    <td><img src="https://raw.githubusercontent.com/Drbsy/dotfiles/main/preview/screenshot-2.png" width="100%"></td>
    <td><img src="https://raw.githubusercontent.com/Drbsy/dotfiles/main/preview/screenshot-3.png" width="100%"></td>
    <td><img src="https://raw.githubusercontent.com/Drbsy/dotfiles/main/preview/screenshot-4.png" width="100%"></td>
  </tr>
  <tr>
    <td><img src="https://raw.githubusercontent.com/Drbsy/dotfiles/main/preview/screenshot-5.png" width="100%"></td>
    <td><img src="https://raw.githubusercontent.com/Drbsy/dotfiles/main/preview/screenshot-6.png" width="100%"></td>
    <td><img src="https://raw.githubusercontent.com/Drbsy/dotfiles/main/preview/screenshot-7.png" width="100%"></td>
  </tr>
  <tr>
    <td><img src="https://raw.githubusercontent.com/Drbsy/dotfiles/main/preview/screenshot-8.png" width="100%"></td>
    <td><img src="https://raw.githubusercontent.com/Drbsy/dotfiles/main/preview/screenshot-9.png" width="100%"></td>
    <td><img src="https://raw.githubusercontent.com/Drbsy/dotfiles/main/preview/screenshot-10.png" width="100%"></td>
  </tr>
</table>

## Keybinds
|key combination|  act|
|--|--|
|SUPER + Q  | open kitty |
|SUPER + E  | open yazi |
|SUPER + R  | open app launcher |
|SUPER + ALT + S  |open settings  |
|SUPER + V  | open clipboard |
|SUPER + C  | close window |
|SUPER + CTRL + S | take region screenshot  |
|SUPER + {1,2,..,0}  |change workspace  |
|POWER BUTTON (XF86PowerOff)  | open power menu |
|SUPER + SHIFT + {arrow_up, arrow_down, arrow_left, arrow_right}  | swap window places |

**read `~/.config/hypr/modules/keybinds.lua` for more information**


## Inspirations
- [sameemul-haque/dotfiles](https://github.com/sameemul-haque/dotfiles)
- [dctxmei/rofi-themes](https://github.com/dctxmei/rofi-themes)
- [LierB/fastfetch](https://github.com/LierB/fastfetch)
