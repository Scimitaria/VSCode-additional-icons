#!/bin/zsh

# Builds the extension to a .vsix file
# You will need to install the vsce package:
# npm install -g @vscode/vsce

# You can then install it with VSCode, or by the CLI:
# code --install-extension /path/to/VSCode-additional-icons.vsix

npm install
vsce package