#!/bin/bash

# Run this file to install the program

echo "Please Note: Your password may be required during the install."

echo "Compiling binary..."
make compile
echo "Installing Binary..."
chmod a-rwx ./battery
chmod u+xw ./battery
sudo cp ./battery /usr/local/bin/
echo "Configuring Launch Agent for user..."
sudo cp ./com.dylan700.battery.plist ~/Library/LaunchAgents/
sudo launchctl unload ~/Library/LaunchAgents/com.dylan700.battery.plist
sudo launchctl load -w ~/Library/LaunchAgents/com.dylan700.battery.plist
echo "Done."
