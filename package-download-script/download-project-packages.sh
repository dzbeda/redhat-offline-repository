#!/usr/bin/env bash
set -euo pipefail

# Define the directory where the packages and their dependencies will be downloaded.
DOWNLOAD_DIR="/data/repo-project-packages"
mkdir -p "$DOWNLOAD_DIR"

# List of specific packages to download, including their exact versions (in NEVRA format).
PACKAGES=(
    "tmux.x86_64"
    "nginx.x86_64"
    "nmap.x86_64"
)

# Notify the user that the download process is starting.
echo "Downloading the latest x86_64 packages (and noarch where specified) and their dependencies to $DOWNLOAD_DIR..."

# Iterate over the list of packages and download each one along with its dependencies.
for pkg in "${PACKAGES[@]}"; do
    echo "Downloading $pkg and dependencies..."
    dnf download --resolve --destdir="$DOWNLOAD_DIR" "$pkg"
done

# Confirm that the download process has completed.
echo "All specified x86_64 (and noarch) packages and their dependencies have been downloaded to $DOWNLOAD_DIR."
