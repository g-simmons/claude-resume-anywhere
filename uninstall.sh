#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

SCRIPT_NAME="claude-resume-anywhere"
INSTALL_PATH="/usr/local/bin/$SCRIPT_NAME"

echo "Uninstalling claude-resume-anywhere..."

# Check if symlink exists
if [ -L "$INSTALL_PATH" ]; then
    echo "Removing symlink..."
    sudo rm "$INSTALL_PATH"
    
    if [ ! -e "$INSTALL_PATH" ]; then
        echo -e "${GREEN}✓ Successfully uninstalled claude-resume-anywhere${NC}"
    else
        echo -e "${RED}Error: Failed to remove symlink${NC}"
        exit 1
    fi
elif [ -f "$INSTALL_PATH" ]; then
    echo -e "${RED}Error: $INSTALL_PATH exists but is not a symlink${NC}"
    echo "This installer only removes symlinks created by install.sh"
    exit 1
else
    echo -e "${YELLOW}claude-resume-anywhere is not installed${NC}"
fi