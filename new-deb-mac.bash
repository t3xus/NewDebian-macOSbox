#!/bin/bash

# Function to display a progress bar (for terminal)
show_progress() {
  echo -n "$1"
  while kill -0 "$!" 2>/dev/null; do
    echo -n "."
    sleep 1
  done
  echo " Done."
}

# Function to install Homebrew (macOS)
install_homebrew() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    if ! command -v brew &> /dev/null; then
      echo "Homebrew is not installed. Installing Homebrew..."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &> /dev/null &
      show_progress "Installing Homebrew"
      echo "Homebrew installed successfully."
    else
      echo "Homebrew is already installed."
    fi
  fi
}

# Function to update system (Debian and macOS)
update_system() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Updating Debian-based system..."
    sudo apt-get update &> /dev/null &
    show_progress "Updating system"
    sudo apt-get upgrade -y &> /dev/null &
    show_progress "Upgrading system"
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Updating macOS system..."
    softwareupdate --install --all &> /dev/null &
    show_progress "Updating system"
  else
    echo "Unsupported OS for this script."
    exit 1
  fi
}

# Function to install packages (TeamViewer, Tailscale, Adobe Reader, LibreOffice)
install_packages() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Installing applications for Debian-based system..."
    sudo apt-get install -y teamviewer tailscale libreoffice curl &> /dev/null &
    show_progress "Installing TeamViewer, Tailscale, LibreOffice"

  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Installing applications for macOS system..."
    brew install --cask teamviewer tailscale adobe-acrobat-reader libreoffice &> /dev/null &
    show_progress "Installing TeamViewer, Tailscale, Adobe Reader, LibreOffice"
  fi
}

# Function to enable dark mode (macOS only)
enable_dark_mode() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Enabling dark mode on macOS..."
    osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'
    echo "Dark mode enabled."
  fi
}

# Function to add a new user
add_new_user() {
  echo -n "Do you want to add a new user? (yes/no): "
  read add_user

  if [[ "$add_user" == "yes" ]]; then
    echo -n "Enter new username: "
    read username
    echo -n "Enter password: "
    read -s password
    echo ""
    echo -n "Should this user be an admin? (yes/no): "
    read is_admin

    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
      sudo useradd -m "$username"
      echo "$username:$password" | sudo chpasswd
      if [[ "$is_admin" == "yes" ]]; then
        sudo usermod -aG sudo "$username"
        echo "User $username added with admin privileges."
      else
        echo "User $username added without admin privileges."
      fi

    elif [[ "$OSTYPE" == "darwin"* ]]; then
      sudo sysadminctl -addUser "$username" -password "$password"
      if [[ "$is_admin" == "yes" ]]; then
        sudo dscl . -append /Groups/admin GroupMembership "$username"
        echo "User $username added with admin privileges."
      else
        echo "User $username added without admin privileges."
      fi
    fi
  else
    echo "No new user will be added."
  fi
}

# Function to clean up unnecessary packages (Debian example)
clean_up_system() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Removing unnecessary packages..."
    sudo apt-get remove -y --purge thunderbird libreoffice-common &> /dev/null &
    show_progress "Removing unwanted packages"
  fi
}

# Main execution starts here

echo "Starting system setup..."

# Install Homebrew if on macOS
install_homebrew

# Update the system
update_system

# Install packages (TeamViewer, Tailscale, Adobe Reader, etc.)
install_packages

# Enable dark mode (macOS only)
enable_dark_mode

# Ask to add a new user
add_new_user

# Clean up unnecessary packages (Debian only)
clean_up_system

echo "System setup complete!"
