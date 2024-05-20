#!/bin/bash

# remove build directory
sudo rm -rf ../os161 && \
# remove autoset path script
sudo rm -f /etc/profile.d/os161.sh && \


echo "Restart to unset path!" 

exit 0