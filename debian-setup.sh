
#!/bin/bash

# New Debian Setup Script
# This script automates the setup of a Debian-based system.

# Update and upgrade the system
update_system() {
  echo "Updating and upgrading the system..."
  sudo apt update && sudo apt upgrade -y
}

# Install common applications
install_common_apps() {
  echo "Installing commonly used applications..."

  sudo apt install -y git wget curl vim tmux htop nodejs python3
  sudo apt install -y libreoffice
  sudo apt install -y teamviewer tailscale

  echo "Common applications installed successfully."
}

# Remove unwanted packages
clean_system() {
  echo "Removing unnecessary packages..."
  sudo apt autoremove -y
  echo "System cleaned up."
}

# Function to create a new user
create_new_user() {
  echo "Would you like to create a new user? (y/n)"
  read create_user
  if [ "$create_user" == "y" ]; then
    echo "Enter the new username:"
    read new_username
    sudo adduser "$new_username"
    echo "User $new_username created successfully."
  else
    echo "User creation skipped."
  fi
}

# Main script execution
main() {
  echo "Starting Debian setup..."
  update_system
  install_common_apps
  clean_system
  create_new_user
  echo "Setup complete!"
}

main
