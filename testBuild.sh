#! /bin/bash
set -xe

SCRIPT_DIR=$(pwd .)
OS161_DIR=$SCRIPT_DIR/os161
TOOLBUILD_DIR=$OS161_DIR/toolbuild
TOOLS_DIR=$OS161_DIR/tools
MAKE_FLAGS="-j"
MAKE_INSTALL_FLAGS="-j"

BMAKE_FLAGS="-j 4"
TEST_OSTREE=$SCRIPT_DIR/buildtest/root
TEST_SRC_DIR=$SCRIPT_DIR/buildtest/src

## add to path might be optional or last step after script run
export PATH=$OS161_DIR/tools/bin:$PATH

rm -rf buildtest
mkdir -p $TEST_OSTREE
tar -xvf os161-* -C buildtest
mv buildtest/os161-* buildtest/src 
cp $SCRIPT_DIR/fixedFiles/usemtest.c $TEST_SRC_DIR/userland/testbin/usemtest/usemtest.c
cd $TEST_SRC_DIR
./configure --ostree=$TEST_OSTREE
# echo defs.mk >> .gitignore
bmake $BMAKE_FLAGS
##Error char c used uninitialized in usemtest.c
# code 
# change line 181: 	char c=' '; 
bmake $BMAKE_FLAGS install

cd $TEST_SRC_DIR/kern/conf
./config DUMBVM
cd ../compile/DUMBVM
bmake $BMAKE_FLAGS depend
bmake $BMAKE_FLAGS
bmake $BMAKE_FLAGS install 
cd $TOOLBUILD_DIR/sys161-*
cp $TOOLS_DIR/share/examples/sys161/sys161.conf.sample $TEST_OSTREE/sys161.conf
cd $TEST_OSTREE
disk161 create LHD0.img 5M
disk161 create LHD1.img 5M
sys161 kernel 's;q'
exit 0

