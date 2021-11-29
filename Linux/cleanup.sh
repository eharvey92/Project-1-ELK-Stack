#!/bin/bash

# Clean up temp directories
rm -rf /tmp/*
rm -rf /var/tmp/*       

# Clear apt cache
apt-get clean -y

# Clear thumbnails
rm -rf /home/sysadmin/.cache/thumbnails

