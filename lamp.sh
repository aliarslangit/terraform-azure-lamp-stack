#!/bin/bash

# Update package information
sudo apt update

# Install Apache
sudo apt install -y apache2

# Install PHP and required modules
sudo apt install -y php libapache2-mod-php php-mysql

# Configure Apache to use PHP
sudo a2enmod php

# Restart Apache
sudo systemctl restart apache2

# Optional: Secure MySQL installation (comment out if not needed)
# sudo mysql_secure_installation

# Output LAMP stack details
echo "LAMP stack installation complete!"
echo "Apache installed and running."
echo "PHP installed and configured."