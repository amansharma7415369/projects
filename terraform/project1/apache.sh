#!/bin/bash

# Update package index
sudo dnf update

# Install Apache
sudo dnf install -y httpd

# Start Apache service
sudo systemctl start httpd

# Enable Apache to start on boot
sudo systemctl enable httpd

# Check Apache service status
sudo systemctl status httpd
