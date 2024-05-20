#!/bin/bash

# runs available individual scripts sequentially
# the os161 will be installed in ../os161

sudo chmod +x *.sh      && \    # make all scripts executable and also obtain sudo permission
./preSetupOS161.sh      && \    # update and upgrade system and also install necessary utilities
./downloadTarballs.sh   && \    # Download necessary os161 tarballs if not already exists
./setupOS161.sh         && \    # Install
./testBuild.sh          && \    # Build a DUMBVM kernel and run sys161 to check os161 installed correctly
./setEnvPermanent.sh    && \    # Add ../os161/tools/bin to environment PATH variable
echo "OS161 Installed successfully!"
exit 0