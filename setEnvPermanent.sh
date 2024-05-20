#!/bin/bash

OS161_BINPATH=$(realpath ../os161/tools/bin)    # path to newly built os161 binaries

echo "Logout and login or restart to set path permanently!"
echo "To start using sys161 immediately, run following command:"
echo "export PATH=\$PATH:$OS161_BINPATH" | sudo tee /etc/profile.d/os161.sh # auto sets path after login
