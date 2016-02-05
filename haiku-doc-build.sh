#! usr/bin/bash

# Update (8/12/14): The Haiku maintainers have enabled the option to
# generate docsets in the doxyfile, so no patching needed.
# refering to commit: https://github.com/haiku/haiku/commit/f36b3f9b3e18f49b640064af67b31797d4a3612b

# This script will only work on:
# A Mac/Hackintosh with OS X
# Xcode 3 or Higher (Due to docsetutil)
# Doxygen
# GNU Make / Commandline utils


# Check if the repo is updated if the person has already cloned the haiku repository
# git pull --rebase and rebuild the doc from there


BUILD_DIR=`pwd`

# This will only work in OS X since it uses docsetutil to generate the docset.
# Clone the Haiku repository
git clone https://github.com/haiku/haiku

# Change in to the haiku current directory.
cd haiku/

# Make a new folder inside the haiku folder.
mkdir generated/

# Change the current directory to the user current directory.
cd docs/user/

# Build makefiles for documentation.
doxygen

# Generate Docset
cd ../../generated/doxygen/html/ && make

# Notify the user of docset generation completion,
echo "Docset generation complete!"

# Move docset from current directory to the build directory.
mv org.haiku.HaikuBook.docset $BUILD_DIR/Haiku_Book.docset

# Edit docset keyword from 'doxygen' to 'haiku'

# Zip up docset and remove .DS_Stores inside
tar --exclude='.DS_Store' -cvzf Haiku_Book.tgz Haiku_Book.docset
