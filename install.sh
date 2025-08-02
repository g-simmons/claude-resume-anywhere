#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Script location
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPT_NAME="claude-resume-anywhere"
SCRIPT_PATH="$SCRIPT_DIR/$SCRIPT_NAME"
INSTALL_PATH="/usr/local/bin/$SCRIPT_NAME"

echo "Installing claude-resume-anywhere..."

# Check if script exists
if [ ! -f "$SCRIPT_PATH" ]; then
    echo -e "${RED}Error: $SCRIPT_NAME not found in $SCRIPT_DIR${NC}"
    exit 1
fi

# Check if /usr/local/bin exists
if [ ! -d "/usr/local/bin" ]; then
    echo -e "${YELLOW}Creating /usr/local/bin directory...${NC}"
    sudo mkdir -p /usr/local/bin
fi

# Remove existing symlink if it exists
if [ -L "$INSTALL_PATH" ]; then
    echo -e "${YELLOW}Removing existing symlink...${NC}"
    sudo rm "$INSTALL_PATH"
elif [ -f "$INSTALL_PATH" ]; then
    echo -e "${RED}Error: $INSTALL_PATH exists and is not a symlink${NC}"
    echo "Please remove it manually before installing"
    exit 1
fi

# Create symlink
echo "Creating symlink..."
ln -s "$SCRIPT_PATH" "$INSTALL_PATH"

# Verify installation
if [ -L "$INSTALL_PATH" ] && [ -e "$INSTALL_PATH" ]; then
    echo -e "${GREEN}✓ Successfully installed claude-resume-anywhere${NC}"
    echo -e "${GREEN}✓ You can now run 'claude-resume-anywhere' from anywhere${NC}"
    
    # Check if /usr/local/bin is in PATH
    if ! echo "$PATH" | grep -q "/usr/local/bin"; then
        echo -e "${YELLOW}Warning: /usr/local/bin is not in your PATH${NC}"
        echo "Add this line to your shell configuration file (.bashrc, .zshrc, etc.):"
        echo "  export PATH=\"/usr/local/bin:\$PATH\""
    fi
else
    echo -e "${RED}Error: Failed to create symlink${NC}"
    exit 1
fi
