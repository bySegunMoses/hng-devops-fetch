#!/bin/bash

# Function to detect the operating system
detect_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "linux"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "mac"
    else
        echo "unknown"
    fi
}

# Detect the OS
OS=$(detect_os)

if [[ "$OS" == "linux" ]]; then
    echo "Detected Linux OS."

    # Update the package lists for upgrades and new package installations
    sudo apt-get update

    # Install net-tools for networking utilities (e.g., netstat)
    sudo apt-get install -y net-tools

    # Install Docker for container management
    sudo apt-get install -y docker.io

    # Install Nginx for web server configurations
    sudo apt-get install -y nginx

    # Install jq for processing JSON data
    sudo apt-get install -y jq

    # Install finger for user information lookup
    sudo apt-get install -y finger

    # Create the directory if it does not exist
    sudo mkdir -p /usr/local/bin

    # Copy the devopsfetch script to /usr/local/bin for global accessibility
    sudo cp devopsfetch.sh /usr/local/bin/devopsfetch

    # Make the devopsfetch script executable
    sudo chmod +x /usr/local/bin/devopsfetch

    # Create a systemd service file for the devopsfetch tool
    sudo tee /etc/systemd/system/devopsfetch.service <<EOF
[Unit]
Description=DevopsFetch Service
After=network.target

[Service]
ExecStart=/usr/local/bin/devopsfetch -t now now
Restart=always

[Install]
WantedBy=multi-user.target
EOF

    # Reload the systemd manager configuration to recognize the new service
    sudo systemctl daemon-reload

    # Enable the devopsfetch service to start on boot
    sudo systemctl enable devopsfetch.service

    # Start the devopsfetch service immediately
    sudo systemctl start devopsfetch.service

    # Create a logrotate configuration for devopsfetch logs
    sudo tee /etc/logrotate.d/devopsfetch <<EOF
/var/log/devopsfetch.log {
    daily
    rotate 7
    compress
    missingok
    notifempty
    create 0640 root adm
    postrotate
        systemctl reload devopsfetch.service > /dev/null 2>/dev/null || true
    endscript
}
EOF

elif [[ "$OS" == "mac" ]]; then
    echo "Detected macOS."

    # Install Homebrew if it's not already installed
    if ! command -v brew &> /dev/null; then
        echo "Homebrew not found. Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    # Install necessary packages using Homebrew
    brew install docker nginx jq

    # Create the directory if it does not exist
    sudo mkdir -p /usr/local/bin

    # Copy the devopsfetch script to /usr/local/bin for global accessibility
    sudo cp devopsfetch.sh /usr/local/bin/devopsfetch

    # Make the devopsfetch script executable
    sudo chmod +x /usr/local/bin/devopsfetch

    # macOS does not use systemd. Instead, you can use launchd or manually run services.
    # To start services manually, use the following commands (adapt as needed):
    echo "Service management is different on macOS. Consider using launchctl or other methods for starting services."

    # Create a logrotate configuration for devopsfetch logs (manual configuration)
    echo "Logrotate is not natively available on macOS. Manual log management may be required."

else
    echo "Unsupported OS detected. This script only supports Linux and macOS."
    exit 1
fi

echo "Installation complete."
