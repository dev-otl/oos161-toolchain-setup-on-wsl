# Update system and install required build tools

    chmod +x wslPreSetupOS161.sh && ./wslPreSetupOS161.sh

## or manually install: build-essential gdb libncurses-dev 

    sudo apt install build-essential gdb libncurses-dev 


# run to build binaries
    chmod +x wslSetupOS161.sh && ./wslSetupOS161.sh

# temporarily add to system path
    PATH=$HOME/path/to/os161/tools/bin:$PATH

# Directories
All files are placed in os161 directory


    os161\src : OS161 base
    os161\toolbuild : extracted tarballs
    os161\tools : build files (binaries)
    os161\tools\bin: binaries used by sys161. *Must be placed in system path before running sys161*


# test build os161 with sample conf
    chmod +x testBuild.sh && ./testBuild.sh

# Links:
[OS161 Official website: (http://os161.org)](http://os161.org)

[!DON'T USE: (https://os161.org)](http://os161.org)
