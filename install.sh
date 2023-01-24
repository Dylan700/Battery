#!/bin/bash

# Run this file to install the program

echo "Please Note: Your password may be required during the install."

echo "Compiling binary..."
make compile
echo "Installing Binary..."
sudo cp ./battery /usr/local/bin/
echo "Configuring Daemon..."
sudo cp ./com.dylan700.battery.plist /Library/LaunchDaemons/
echo "Done."
