
# NewDebian-macOSbox

![Static Badge](https://img.shields.io/badge/Author-Jgooch-1F4D37)  
![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)  
![Static Badge](https://img.shields.io/badge/Distribution-npm-orange)  
![Target](https://img.shields.io/badge/Target-macOS-cccccc)  
![Target](https://img.shields.io/badge/Target-Debian-red)  

## System Setup and Application Deployment Script (Debian/macOS)

### Overview

This script automates the system setup and configuration on **Debian-based Linux distributions** and **macOS**, providing distinct and specialized features for each platform.

---

### Key Differences Between macOS and Debian Versions:
- **macOS**:
  - Installs and configures Homebrew as the package manager.
  - Enables macOS-specific GUI customizations like **Dark Mode**, **Dock adjustments**, and **Finder preferences**.
  - Installs GUI apps like Google Chrome, Slack, Spotify, and Adobe Acrobat Reader via Homebrew Cask.
  - Automates Xcode Command Line Tools installation.
  - Allows user creation with admin privileges using `sysadminctl`.

- **Debian**:
  - Uses `apt` for package management.
  - Handles unwanted package cleanup using `apt autoremove`.
  - Focused on CLI tools and lightweight GUI app installations for server environments.
  - Includes Debian-specific services setup.

---

### Main Features:
- **System Update**: Updates all system packages to their latest versions.
- **Homebrew Installation** (macOS): Installs Homebrew if not present and configures the shell environment.
- **Dark Mode** (macOS): Automatically enables Dark Mode using AppleScript.
- **User Creation**: Prompts to create a new user with or without admin privileges.
- **Common Application Installation**: Installs essential tools and applications, including:
  - TeamViewer
  - Tailscale
  - Adobe Acrobat Reader
  - LibreOffice
  - Google Chrome
  - Visual Studio Code
  - Spotify
- **Clean Up** (Debian): Removes unused packages to save disk space.

---

### Applications Installed:
| Application         | macOS                | Debian               |
|---------------------|----------------------|----------------------|
| **TeamViewer**      | ✅ via Homebrew      | ✅ via apt           |
| **Tailscale**       | ✅ via Homebrew      | ✅ via apt           |
| **Adobe Reader**    | ✅ via Homebrew      | N/A                 |
| **LibreOffice**     | ✅ via Homebrew      | ✅ via apt           |
| **Google Chrome**   | ✅ via Homebrew      | ✅ via apt           |
| **Spotify**         | ✅ via Homebrew      | ✅ via snap          |

---

### How to Use

#### macOS Instructions:
1. **Download the Script**:  
   Save the script as `macos-setup.sh`.

2. **Make the Script Executable**:  
   ```bash
   chmod +x macos-setup.sh
   ```

3. **Run the Script**:  
   ```bash
   ./macos-setup.sh
   ```

4. **Follow Prompts**:  
   - Configure macOS settings.
   - Install applications via Homebrew.
   - Create a new user, if desired.

---

#### Debian Instructions:
1. **Download the Script**:  
   Save the script as `debian-setup.sh`.

2. **Make the Script Executable**:  
   ```bash
   chmod +x debian-setup.sh
   ```

3. **Run the Script**:  
   ```bash
   ./debian-setup.sh
   ```

4. **Follow Prompts**:  
   - Update and clean the system.
   - Install applications via `apt`.

---

### Example of Script Execution:
```bash
# macOS
./macos-setup.sh

# Debian
./debian-setup.sh
```

During execution, the script will:
- Configure the system (specific to the operating system).
- Install the specified applications.
- Optionally create a new user with or without admin privileges.

---

### License
This project is licensed under the **MIT License**. See the LICENSE file for details.

---

For further questions or issues, feel free to reach out! 🚀
