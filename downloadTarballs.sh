#!/bin/bash
#set -xe

TARBALLS=(\
    binutils-2.24+os161-2.1.tar.gz \
    gcc-4.8.3+os161-2.1.tar.gz \
    gdb-7.8+os161-2.1.tar.gz \
    os161-base-2.0.3.tar.gz \
    sys161-2.0.8.tar.gz \
)
BASELINK=http://os161.org/download/

for tarball in ${TARBALLS[@]}
    do
    #if [ -f $tarball ]
    #    then echo "removing existing $tarball";
    #         rm $tarball;
    #fi
    echo downloading $tarball;
    wget -nc $BASELINK$tarball;
    echo Done!
done

exit
