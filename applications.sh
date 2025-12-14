packages=(
	"discord"
	"firefox"
	"gimp"
	"libreoffice-fresh"
	"obs-studio"
	"tidal-hifi-bin"
	"visual-studio-code-bin"
	"zed"
)

paru -S "${packages[@]}" --needed
