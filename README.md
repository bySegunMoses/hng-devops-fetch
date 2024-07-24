# Devopsfetch: Your Ultimate DevOps Companion

Welcome to **Devopsfetch**, a command-line tool crafted for DevOps professionals and system administrators! Whether you're a seasoned pro or just starting out, Devopsfetch is designed to make your life easier by giving you insights into your system's ports, Docker containers, Nginx configurations, and user activities. Plus, it supports continuous monitoring with a systemd service.

## 🚀 Key Features

- **Ports:**
  - See all active ports and services.
  - Dive into detailed info about a specific port.

- **Docker:**
  - Get a list of all Docker images and containers.
  - Fetch in-depth details about a particular Docker container.

- **Nginx:**
  - Discover all Nginx domains and their associated ports.
  - Extract detailed configuration info for any Nginx domain.

- **Users:**
  - List all users and their last login times.
  - Retrieve detailed information about a specific user.

- **Time Range:**
  - Examine activities within a specific time range.

- **Systemd Service:**
  - Enable continuous monitoring and logging of system activities.

## 🔧 Installation Guide

### Prerequisites

Before installing Devopsfetch, make sure you have the following dependencies:

- **Linux:** `net-tools`, `docker`, `nginx`, and `systemd`
- **macOS:** Install similar tools via Homebrew.
- **Windows:** Use WSL2 (Windows Subsystem for Linux) to install a compatible Linux environment.

Install these dependencies with the following command:

```bash
sudo apt-get update
sudo apt-get install net-tools docker.io nginx
```

For macOS, use Homebrew:

```bash
brew install net-tools docker nginx
```

For Windows users, follow the WSL2 setup guide to install these tools in your WSL2 environment.

### Installation Script

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/bySegunMoses/hng-devops-fetch.git
   cd devopsfetch
   ```

2. **Give the install.sh script permission to run:**

   ```bash
   chmod +x install.sh
   ```
   
3. **Run the Installation Script:**

   ```bash
   sudo ./install.sh
   ```

   This will set up all the necessary components and configure a systemd service for continuous monitoring.

## 🛠 Usage Instructions

### General Syntax

```bash
devopsfetch [OPTION]
```

### 📡 Ports

- **List all active ports and services:**

  ```bash
  devopsfetch -p
  ```

- **Get details for a specific port:**

  ```bash
  devopsfetch -p <port_number>
  ```

### 🐳 Docker

- **View all Docker images and containers:**

  ```bash
  devopsfetch -d
  ```

- **Retrieve information about a specific container:**

  ```bash
  devopsfetch -d <container_name>
  ```

### 🌐 Nginx

- **List all Nginx domains and their ports:**

  ```bash
  devopsfetch -n
  ```

- **Get detailed info for a specific domain:**

  ```bash
  devopsfetch -n <domain>
  ```

### 👥 Users

- **Show all users and their last login times:**

  ```bash
  devopsfetch -u
  ```

- **Fetch details about a specific user:**

  ```bash
  devopsfetch -u <username>
  ```

### ⏳ Time Range

- **Display activities within a time range:**

  ```bash
  devopsfetch -t "start_time" "end_time"
  ```

  Replace `start_time` and `end_time` with timestamps in `YYYY-MM-DD HH:MM:SS` format.

## 📚 Help and Documentation

Need help? Just run:

```bash
devopsfetch -h
```

### 🔍 Example Commands

- List all active ports:

  ```bash
  devopsfetch -p
  ```

- Show Docker containers:

  ```bash
  devopsfetch -d
  ```

- View Nginx configs for a domain:

  ```bash
  devopsfetch -n example.com
  ```

- Get user details:

  ```bash
  devopsfetch -u username
  ```

- Check activities between two dates:

  ```bash
  devopsfetch -t "2024-07-21 00:00:00" "2024-07-22 00:00:00"
  ```

## 🤝 Contributing

We welcome contributions! Fork the repository and submit a pull request with your improvements.

## ✨ Show Your Support

If you find Devopsfetch helpful, drop a follow to stay updated with our latest projects and tools. Your support keeps us going!

Happy DevOps-ing! 🚀

---

Feel free to customize further based on your specific needs or add more details if necessary!