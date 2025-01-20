brew install volta

volta install node
volta install npm

packages=(
  eslint
  nodemon
)

npm install -g "${packages[@]}"
