#!/bin/bash
set -e

# Update package index
sudo apt-get update

# Install utilities and programming languages
sudo apt-get install -y wget curl vim golang git build-essential unzip python3 python3-pip

# Install basic network and hacking tools
sudo apt-get install -y nmap netcat-traditional 1.10-48

# Install additional hacking tools from apt
sudo apt-get install -y amass seclists masscan ffuf gobuster wfuzz nuclei jq tmux

# Install Go (if not installed)
if ! command -v go &> /dev/null; then
    sudo apt-get install -y golang
fi

# Set GOPATH and update PATH in .bashrc if not already present
if ! grep -q 'export GOPATH' ~/.bashrc; then
    echo 'export GOPATH=$HOME/go' >> ~/.bashrc
    echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
fi

# Install Node.js (required for some tools like Aquatone)
if ! command -v node &> /dev/null; then
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

# Install Go-based tools
# Assetfinder
if ! command -v assetfinder &> /dev/null; then
    go install github.com/tomnomnom/assetfinder@latest
    sudo cp ~/go/bin/assetfinder /usr/local/bin/
fi
# Subfinder
if ! command -v subfinder &> /dev/null; then
    go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
    sudo cp ~/go/bin/subfinder /usr/local/bin/
fi
# DNSx
if ! command -v dnsx &> /dev/null; then
    go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest
    sudo cp ~/go/bin/dnsx /usr/local/bin/
fi
# HTTPx
if ! command -v httpx &> /dev/null; then
    go install github.com/projectdiscovery/httpx/cmd/httpx@latest
    sudo cp ~/go/bin/httpx /usr/local/bin/
fi
# Naabu
if ! command -v naabu &> /dev/null; then
    go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
    sudo cp ~/go/bin/naabu /usr/local/bin/
fi
# Aquatone (requires npm & nodejs, or download release)
# Gowitness
if ! command -v gowitness &> /dev/null; then
    go install github.com/sensepost/gowitness@latest
    sudo cp ~/go/bin/gowitness /usr/local/bin/
fi
# Hakrawler
if ! command -v hakrawler &> /dev/null; then
    go install github.com/hakluke/hakrawler@latest
    sudo cp ~/go/bin/hakrawler /usr/local/bin/
fi

# Install Arjun (via pip)
pip3 install arjun

# Verify installation

echo "Installation successful, let's check versions:"
wget --version
curl --version
vim --version
go version
git --version
python3 --version
pip3 --version
nmap --version
nc -h | head -n 1

# Note: Other tools that require manual or pip installation:
# - crobat, findomain, github-subdomains, gitlab-subdomains, massdns, puredns, httprobe, gospider, katana, x8, linkfinder, secretfinder, subjs, xnlinkfinder, dontgo403, corsy, corscanner, fuzzuli, ppfuzz, ppmap, lfisuite, ssrfmap, gopherus, interactsh, autossrf, tplmap, kiterunner, dalfox, kxss, xsstrike, nosqlmap, jaeles, wpscan, droopescan, aem-hacker, oneforall, gitdorker, gitgraber, githacker, gittools, dumpsterdiver, earlybird, ripgrep, trufflehog, anew, anti-burl, getallurls, gron, interlace, qsreplace, unfurl, uro
# Please install the above tools manually as needed following their documentation.


