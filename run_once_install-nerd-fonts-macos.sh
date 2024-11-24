#!/bin/bash
set -e

# Define the fonts to install
FONTS=("JetBrainsMono" "FiraCode")
FONT_DIR="$HOME/Library/Fonts"
FONT_REPO="https://github.com/ryanoasis/nerd-fonts/releases/latest/download"

echo "Installing Nerd Fonts..."

mkdir -p "$FONT_DIR"

for FONT in "${FONTS[@]}"; do
    echo "Downloading $FONT..."
    curl -L -o "/tmp/${FONT}.zip" "${FONT_REPO}/${FONT}.zip"
    echo "Installing $FONT..."
    unzip -o "/tmp/${FONT}.zip" -d "$FONT_DIR"
done

echo "Nerd Fonts installation complete!"
