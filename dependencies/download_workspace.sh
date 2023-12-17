#!/bin/bash
 cd ../
 current_path=$(pwd)
 read -p "Enter the new folder name: " FOLDER_NAME

# Validate folder name
if [[ -z "$FOLDER_NAME" ]]; then
  echo "Error: Please enter a valid folder name."
  exit 1
fi

# Create the new folder
mkdir "$FOLDER_NAME"

# Change directory to the new folder
cd "$FOLDER_NAME"

# First command: repo init
echo "Running the first 'repo init'..."
repo init -u "https://git.visteon.com/visteon-android/mediatek/platform/manifest" -b "ucl_main2_tata_x4" -m "di/vip_144.xml" --

# Check for success before proceeding
if [[ $? -ne 0 ]]; then
  echo "Error: First 'repo init' failed."
  exit 1
fi

# Second command: repo init with different repo-url
echo "Running the second 'repo init'..."
repo init -u "https://git.visteon.com/visteon-android/mediatek/platform/manifest" -b "ucl_main2_tata_x4" -m "di/vip_144.xml" --repo-url="http://git.pune.visteon.com/repo-tools/repo-v2.8" --no-clone-bundle

# Check for success before proceeding
if [[ $? -ne 0 ]]; then
  echo "Error: Second 'repo init' failed."
  exit 1
fi

# Third command: repo sync
echo "Running 'repo sync'..."
repo sync -c --optimized-fetch --no-clone-bundle --no-tags --force-sync -j20

# Check for success before finishing
if [[ $? -ne 0 ]]; then
  echo "Error: 'repo sync' failed."
  exit 1
fi

echo "Repo initialization and sync completed for $FOLDER_NAME!"

 current_path=$(pwd)
 echo $current_path
  read -p "Press Enter to exit to Main Menu..."