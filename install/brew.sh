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
  font-hack-nerd-font
  font-jetbrains-mono-nerd-font
  git
  grep
  kitty
  lazygit
  python
  neofetch
  neovim
  rabbitmq
  ripgrep
  redis
  sketchybar
)

brew install "${apps[@]}"

# Git comes with diff-highlight, but isn't in the PATH
ln -sf "$(brew --prefix)/share/git-core/contrib/diff-highlight/diff-highlight" /usr/local/bin/diff-highlight
