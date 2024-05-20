#!/bin/bash

sudo rm -rf ../os161                && \        # remove built directory
sudo rm -f /etc/profile.d/os161.sh  && \        # remove autoset path script
echo "Restart to unset path!" 

exit 0