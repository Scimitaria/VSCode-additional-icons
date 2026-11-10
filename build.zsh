#!/bin/zsh

# Builds the extension to a .vsix file
# You will need to install the vsce package:
# npm install -g @vscode/vsce

# You can then install it with VSCode, or by the CLI:
# code --install-extension /path/to/VSCode-additional-icons.vsix

# Could replace with JS script in package.json, see:
# https://github.com/microsoft/vscode/blob/main/extensions/theme-seti/build/update-icon-theme.js

npm install
vsce package

while IFS= read -r line; do
    if [[ "$line" =~ "\"version\": \"([0-9]+.[0-9]+.[0-9]+)\"" ]]; then
        version="$match[1]"
        code --install-extension "vscode-additional-icons-$version.vsix"
        rm *.vsix
        exit
    fi
done < package.json

print "ERROR: version not found in package.json!" >&2
