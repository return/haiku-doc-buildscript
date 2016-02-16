#! usr/bin/bash

# Update (8/12/14): The Haiku maintainers have enabled the option to
# generate docsets in the doxyfile, so no patching needed.
# refering to commit: https://github.com/haiku/haiku/commit/f36b3f9b3e18f49b640064af67b31797d4a3612b

# This script will only work on:
# A Mac/Hackintosh with OS X
# Xcode 3 or Higher (Due to docsetutil)
# Doxygen
# OS X command line utils
# GNU Make / binutils


# TODO, cleanup command to remove the prebuilt, docset without removing the entire haiku repo.

# Check if the repo is updated if the person has already cloned the haiku repository.
# git pull --rebase and rebuild the doc from there.

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

# Check if the docset is present in the html folder.

# If it is there, tell the dev that the docset generation is complete.
echo "Docset update complete!"

# Exit if it isn't in the directory

# Move docset from current directory to the build directory.
mv org.haiku.HaikuBook.docset $BUILD_DIR/Haiku_Book.docset

# Change directory to the docset file.
cd $BUILD_DIR/Haiku_Book.docset

# Edit docset keyword from 'doxygen' to 'haiku'

# Zip up docset and remove .DS_Stores inside
tar --exclude='.DS_Store' -cvzf Haiku_Book.tgz Haiku_Book.docset

# Notify the user of docset update completion.
# echo "Docset update complete!"
