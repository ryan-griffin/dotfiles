packages=(
	"stow"
	"zsh"
	"zsh-autocomplete"
	"zsh-autosuggestions"
	"zsh-syntax-highlighting"
	"zsh-completions"
	"starship"
	"eza"
	"bat"
	"ripgrep"
	"inter-font"
	"ttf-jetbrains-mono-nerd"
	"ttf-apple-emoji"
	"hyprland"
	"hyprpaper"
	"xdg-desktop-portal-hyprland"
	"xdg-user-dirs"
	"xdg-utils-handlr"
	"polkit-gnome"
	"waybar"
	"wofi"
	"mako"
	"swayidle"
	"gtklock"
	"cliphist"
	"grimblast"
	"pipewire-pulse"
	"playerctl"
	"brightnessctl"
	"udiskie"
	"ly"
	"kitty"
	"gradience"
	"adw-gtk3"
	"firefox"
	"discord"
	"neovim"
	"git-credential-manager-core-bin"
	"visual-studio-code-bin"
	"gnome-keyring"
)

exec paru -S "${packages[@]}"
