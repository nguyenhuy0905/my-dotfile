#!/bin/sh

# script to automate vscode extension-installation
install_list=$(cat ./vscode/vscode_extension_list.txt)

printf "$install_list\n"

for item in $install_list; do
    code --install-extension $item
done
