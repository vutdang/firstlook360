#!/bin/sh

# If the download doesn't work, the release link may have changed.
# Check http://krpano.com/download/, copy the address of the
# latest release, and replace in the shell script.

# CHANGE THIS TO THE APPROPRIATE FILENAME
FNAME=download.php?file=krpano1185linux32&server=cdn

echo "Creating ~/bin directory if it doesn't exist..."
mkdir -p ~/bin

echo "Removing old versions of krpano..."
rm -rf ~/bin/krpano*

echo "Downloading krpano..."
wget -P /home/root/bin http://krpano.com/download/$FNAME

echo "Unpacking..."
tar -xf /home/root/bin/$FNAME -C /home/root/bin

echo "Cleaning up..."
rm /home/root/bin/$FNAME
mv /home/root/bin/krpano*/ /home/root/bin/krpano
