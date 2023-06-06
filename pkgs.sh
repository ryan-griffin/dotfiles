packages=(
	"zsh"
	"zsh-autocomplete"
	"zsh-autosuggestions"
	"zsh-syntax-highlighting"
	"zsh-completions"
	"starship"
	"exa"
	"bat"
	"ripgrep"
	"inter-font"
	"ttf-jetbrains-mono-nerd"
	"ttf-apple-emoji"
	"hyprland"
	"hyprpaper"
	"hyprpicker"
	"xdg-desktop-portal-hyprland"
	"xdg-user-dirs"
	"polkit-gnome"
	"waybar-hyprland-git"
	"rofi-lbonn-wayland"
	"mako"
	"gtklock"
	"cliphist"
	"grimblast"
	"pipewire-pulse"
	"playerctl"
	"brightnessctl"
	"udiskie"
	"nwg-displays"
	"wlr-randr"
	"nwg-look-bin"
	"ly"
	"kitty"
	"firefox"
	"webcord-bin"
	"spotify"
	"spicetify-cli"
	"visual-studio-code-bin"
	"gnome-keyring"
)

exec paru -S "${packages[@]}"
