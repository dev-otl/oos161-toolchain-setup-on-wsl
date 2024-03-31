Place the files in directory containing following .tar.gz files:
+ binutils-2.24+os161-2.1.tar.gz
+ gcc-4.8.3+os161-2.1.tar.gz
+ gdb-7.8+os161-2.1.tar.gz
+ os161-base-2.0.3.tar.gz
+ sys161-2.0.8.tar.gz

# Update system and install required build tools

    chmod +x wslPreSetupOS161.sh && ./wslPreSetupOS161.sh

## or manually install: build-essential gdb libncurses-dev 

    sudo apt install build-essential gdb libncurses-dev 

# run to build binaries
    chmod +x wslSetupOS161.sh && ./wslSetupOS161.sh


# Directories
If scripts run successfully, all outputs can be found in os161 directory:

    os161\src: OS161 base
    os161\toolbuild: extracted tarballs
    os161\tools: build files (binaries)
    os161\tools\bin: binaries used by sys161. *Must be placed in system path before running sys161*

# Set environment variable PATH
The full path to os161/tools/bin needs to be added to the environment variable PATH before running sys161.

To add path in current shell:

    PATH=$HOME/path/to/os161/tools/bin:$PATH

# test build os161 with sample conf
    chmod +x testBuild.sh && ./testBuild.sh

# Links:
[OS161 Official website: (http://os161.org)](http://os161.org)

[Download tarballs here](http://os161.org/download/)

[!DON'T USE https link: (https://os161.org)](http://os161.org)

