
#!/bin/bash

sudo su

# Update all installed packages
yum update -y 

# Install Apache http server
yum install -y httpd

# Install Git
yum install -y git

# Clone the project repository to /tmp (temporary directory)
git clone https://github.com/Godwin-svg/static-website.git /tmp/static-website

# Copy all files (including hidden ones) to Apache's web root
cp -R /tmp/static-website/. /var/www/html

# Remove the temporary cloned repository
rm -rf /tmp/static-website

# Enable Apache to start automatically at boot
systemctl enable httpd

# Start Apache service
systemctl start httpd
