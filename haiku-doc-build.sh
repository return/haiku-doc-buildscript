#! usr/bin/bash

#This script will only work on:
# A Mac/Hackintosh with OS X
# Xcode 3 or Higher
# Doxygen
# GNU Make / Commandline utils


# Also check if the repo is updated if the person has
# already cloned the haiku repository
# git pull --rebase and rebuild the doc from there


# This will only work in OS X, (docsetutil)
# if echo $OSTYPE != darwin;
# echo Sorry, but this script only supports OS X
# Clone the Haiku repository #
git clone https://git.haiku-os.org/haiku

# Change in to the current directory #
cd haiku/

# Make a new folder inside the haiku folder
mkdir generated/

cd docs/user/

# Patch Doxyfile

doxygen

cd ../../generated/doxygen/html/ && make

# From here, the documentation is generated but it needs to be patched.
