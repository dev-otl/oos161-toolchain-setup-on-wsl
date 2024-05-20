#! /bin/bash
#set -xe

SCRIPT_DIR=$(pwd .)
OS161_DIR=$SCRIPT_DIR/../os161
TOOLBUILD_DIR=$OS161_DIR/toolbuild
TOOLS_DIR=$OS161_DIR/tools

TESTBUILD_DIR=$SCRIPT_DIR/testbuild
TEST_OSTREE=$TESTBUILD_DIR/root
TEST_SRC_DIR=$TESTBUILD_DIR/src

MAKE_FLAGS="-j"
MAKE_INSTALL_FLAGS="-j"

BMAKE_FLAGS="-j 4"


## add to path might be optional or last step after script run
export PATH=$OS161_DIR/tools/bin:$PATH

rm -rf $TESTBUILD_DIR
mkdir -p $TEST_OSTREE

tar -xvf os161-* -C $TESTBUILD_DIR
mv $TESTBUILD_DIR/os161-* $TESTBUILD_DIR/src 
cp $SCRIPT_DIR/fixedFiles/usemtest.c $TEST_SRC_DIR/userland/testbin/usemtest/usemtest.c

cd $TEST_SRC_DIR
./configure --ostree=$TEST_OSTREE
bmake $BMAKE_FLAGS
bmake $BMAKE_FLAGS install

cd $TEST_SRC_DIR/kern/conf
./config DUMBVM

cd ../compile/DUMBVM
bmake $BMAKE_FLAGS depend
bmake $BMAKE_FLAGS
bmake $BMAKE_FLAGS install 

cp $TOOLS_DIR/share/examples/sys161/sys161.conf.sample $TEST_OSTREE/sys161.conf
cd $TEST_OSTREE
disk161 create LHD0.img 5M
disk161 create LHD1.img 5M
sys161 kernel 's;q'

exit 0

