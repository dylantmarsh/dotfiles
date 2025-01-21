# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew upgrade

# Top formulae
formulae=(
  FelixKratz/formulae
)

brew tap "${formulae[@]}"

# Install packages
apps=(
  bottom
  cmake
  fd
  ffmpeg
  fish
  font-hack-nerd-font
  font-jetbrains-mono-nerd-font
  fzf
  git
  grep
  imagemagick
  kitty
  lazygit
  poppler
  python
  neofetch
  neovim
  rabbitmq
  ripgrep
  redis
  sketchybar
  sevenzip
  yazi
  zoxide
)

brew install "${apps[@]}"

# Git comes with diff-highlight, but isn't in the PATH
ln -sf "$(brew --prefix)/share/git-core/contrib/diff-highlight/diff-highlight" /usr/local/bin/diff-highlight
