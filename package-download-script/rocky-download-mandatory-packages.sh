#!/usr/bin/env bash
set -euo pipefail

# Define the directory where the packages and their dependencies will be downloaded.
DOWNLOAD_DIR="/data/repo-mandatory-packages"
mkdir -p "$DOWNLOAD_DIR"

# List of specific packages to download, including their exact versions (in NEVRA format).
PACKAGES=(
    "drpm-0.4.1-3.el8.x86_64"
    "createrepo_c-libs-0.17.7-6.el8.x86_64"
    "createrepo_c-0.17.7-6.el8.x86_64"
    "apr-1.6.3-12.el8.x86_64"
    "apr-util-1.6.1-9.el8.x86_64"
    "httpd-2.4.37-65.module+el8.10.0+1842+4a9649e8.2"
    "httpd-filesystem-2.4.37-65.module+el8.10.0+1842+4a9649e8.2.noarch"
    "httpd-tools-2.4.37-65.module+el8.10.0+1842+4a9649e8.2.x86_64"
    "mod_http2-1.15.7-10.module+el8.10.0+1883+38ed6c58.1.x86_64"
    "mod_ssl-1:2.4.37-65.module+el8.10.0+1842+4a9649e8.2.x86_64"
)

# Notify the user that the download process is starting.
echo "Downloading specified packages and their dependencies to $DOWNLOAD_DIR..."

# Iterate over the list of packages and download each one along with its dependencies.
for pkg in "${PACKAGES[@]}"; do
    echo "Downloading $pkg and dependencies..."
    dnf download --resolve --destdir="$DOWNLOAD_DIR" "$pkg"
done

# Confirm that the download process has completed.
echo "All specified packages and their dependencies have been downloaded to $DOWNLOAD_DIR."