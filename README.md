# Ubuntu Hack Docker Tools Installer

This script automatically installs various hacking, enumeration, and essential utility tools on Ubuntu. Perfect for pentesting, bug bounty, CTF, and other security activities.

## Usage

1. Clone this repository:
   ```sh
   git clone https://github.com/username/ubuntu-hackdoceker.git
   cd ubuntu-hackdoceker
   ```
2. Make the script executable:
   ```sh
   chmod +x install_tools.sh
   ```
3. Run the script:
   ```sh
   ./install_tools.sh
   ```

## Tools Installed Automatically
- wget, curl, vim, golang, git, build-essential, unzip, python3, pip
- nmap, netcat, amass, seclists, masscan, ffuf, gobuster, wfuzz, nuclei, jq, tmux
- Go-based tools: assetfinder, subfinder, dnsx, httpx, naabu, gowitness, hakrawler
- arjun (via pip)

## Important Notes
- This script updates the package index and installs tools from apt, Go, and pip.
- Some other tools not available in the repository or via Go must be installed manually. See the comments at the end of the script for the list.
- The script will automatically add GOPATH to ~/.bashrc if not already present.

## Contribution
Feel free to submit a pull request to add more tools or improvements.

## License
MIT
