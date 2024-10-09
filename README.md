# NewDebian-macOSbox

![Static Badge](https://img.shields.io/badge/Author-Jgooch-1F4D37)
![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)
![Static Badge](https://img.shields.io/badge/Distribution-npm-orange)
![Target](https://img.shields.io/badge/Target-macOS-cccccc)
![Target](https://img.shields.io/badge/Target-Debian-red)
# System Setup and Application Deployment Script (Debian/macOS)

## Overview

This script automates the system setup and configuration on **Debian-based Linux distributions** and **macOS**.

### Main Features:
- **System Update**: Automatically updates the system to the latest software versions.
- **Homebrew Installation**: Installs Homebrew on macOS if it's not already installed.
- **Package Installation**: Silently installs essential applications like **TeamViewer**, **Tailscale**, **Adobe Acrobat Reader**, and **LibreOffice**.
- **Dark Mode**: Enables dark mode on macOS.
- **New User Creation**: Prompts the user to create a new system user, with an option to give admin privileges.
- **Clean Up**: Removes unwanted packages from Debian-based systems.
  
## Applications Installed:
- **TeamViewer**: Remote control and desktop sharing.
- **Tailscale**: Secure VPN for easy remote access.
- **Adobe Acrobat Reader**: PDF reader.
- **LibreOffice**: Office suite (equivalent to Microsoft Office).

## Prerequisites

- **Debian-based systems**: Requires `apt` for package management.
- **macOS**: Uses **Homebrew** for package management.
- Internet connection is required for downloading packages and updates.

## How to Use

1. **Download the Script**:
   - Copy the script into a file on your system (e.g., `system-setup.sh`).

2. **Make the Script Executable**:
   Run the following command to make the script executable:
   ```bash
   chmod +x system-setup.sh
   ```

3. **Run the Script**:
   Execute the script with:
   ```bash
   ./system-setup.sh
   ```

4. **Follow Prompts**:
   - The script will prompt you for creating a new user, and whether to give admin privileges.
   - The script will also automatically handle system updates and application installations.

## Example of Script Execution

```bash
./system-setup.sh
```

During execution, the script will:
- Check and install Homebrew on macOS if not already present.
- Update system software.
- Install the specified applications.
- Optionally, create a new user with or without admin privileges.
- Clean up unnecessary packages (Debian only).
