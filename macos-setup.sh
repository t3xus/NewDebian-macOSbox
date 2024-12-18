
#!/bin/bash

# New macOS Setup Script. Gooch James 2024
# This script automates the setup of a macOS system, including installing Homebrew and commonly used applications, as well as additional setup features.

# Function to check and install Xcode Command Line Tools
install_xcode_tools() {
  echo "Checking for Xcode Command Line Tools..."
  xcode-select -p &>/dev/null
  if [ $? -ne 0 ]; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
    echo "Please follow the on-screen instructions to complete the installation."
    echo "Rerun this script after Xcode tools are installed."
    exit 1
  else
    echo "Xcode Command Line Tools are already installed."
  fi
}

# Function to install Homebrew
install_homebrew() {
  echo "Checking for Homebrew..."
  if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Homebrew installed successfully."
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    echo "Homebrew is already installed."
  fi
}

# Function to install common applications via Homebrew
install_common_apps() {
  echo "Updating Homebrew..."
  brew update

  echo "Installing commonly used applications..."

  # Install CLI tools
  brew install git
  brew install wget
  brew install node
  brew install python3
  brew install htop
  brew install tmux

  # Install GUI applications
  echo "Installing GUI applications..."
  brew install --cask google-chrome
  brew install --cask visual-studio-code
  brew install --cask slack
  brew install --cask spotify
  brew install --cask zoom
  brew install --cask rectangle
  brew install --cask iterm2
  brew install --cask firefox
  brew install --cask postman
  brew install --cask docker
  brew install --cask teamviewer
  brew install --cask tailscale
  brew install --cask adobe-acrobat-reader
  brew install --cask libreoffice

  echo "Cleaning up Homebrew..."
  brew cleanup
  echo "Applications installed successfully."
}

# Function to configure macOS settings
configure_macos_settings() {
  echo "Configuring macOS settings..."

  # Dock settings
  echo "Configuring Dock settings..."
  defaults write com.apple.dock autohide -bool true
  defaults write com.apple.dock magnification -bool true
  defaults write com.apple.dock tilesize -int 36
  killall Dock

  # Finder settings
  echo "Configuring Finder settings..."
  defaults write com.apple.finder AppleShowAllFiles -bool true
  defaults write com.apple.finder ShowPathbar -bool true
  defaults write com.apple.finder ShowStatusBar -bool true
  killall Finder

  # Enable Dark Mode
  echo "Enabling Dark Mode..."
  osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'

  # Other settings
  echo "Configuring miscellaneous macOS settings..."
  defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
  defaults write NSGlobalDomain KeyRepeat -int 1
  defaults write NSGlobalDomain InitialKeyRepeat -int 15

  echo "macOS settings configured."
}

# Function to create a new user
create_new_user() {
  echo "Would you like to create a new user? (y/n)"
  read create_user
  if [ "$create_user" == "y" ]; then
    echo "Enter the new username:"
    read new_username
    echo "Enter the full name of the new user:"
    read full_name
    echo "Should this user have admin privileges? (y/n)"
    read admin_privileges

    if [ "$admin_privileges" == "y" ]; then
      sudo sysadminctl -addUser "$new_username" -fullName "$full_name" -admin
      echo "Admin user $new_username created successfully."
    else
      sudo sysadminctl -addUser "$new_username" -fullName "$full_name"
      echo "Standard user $new_username created successfully."
    fi
  else
    echo "User creation skipped."
  fi
}

# Main script execution
main() {
  echo "Starting macOS setup..."

  install_xcode_tools
  install_homebrew
  install_common_apps
  configure_macos_settings
  create_new_user

  echo "Setup complete! Enjoy your newly configured macOS system."
}

main
