#!/bin/bash

# runs available individual scripts sequentially
# the os161 will be installed in ../os161

                               
# make all scripts executable and also obtain sudo permission
sudo chmod +x *.sh      && \
# update and upgrade system and also install necessary utilities 
./preSetupOS161.sh      && \
# Download necessary os161 tarballs if not already exists 
./downloadTarballs.sh   && \
# Install 
./setupOS161.sh         && \
# Build a DUMBVM kernel and run sys161 to check os161 installed correctly 
./testBuild.sh          && \
# Add ../os161/tools/bin to environment PATH variable 
./setEnvPermanent.sh    && \
echo "\nOS161 Installed successfully!"
exit 0