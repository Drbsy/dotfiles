local apps = {}

apps.pywal_colors      = require("modules.pywal_colors")
apps.terminal          = "kitty"
apps.fileManager       = "kitty -e yazi"
apps.hyprlock          = "hyprlock"

apps.menu              = "~/.config/rofi/scripts/launcher.sh"
apps.power_menu        = "~/.config/rofi/scripts/powermenu.sh"
apps.settings          = "~/.config/rofi/scripts/settings.sh"
apps.clip              = "~/.config/rofi/scripts/clipboard.sh"

apps.region_screenshot = "hyprshot -m region -o ~/Pictures/screenshots"

return apps
