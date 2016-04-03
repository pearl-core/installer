#!/bin/bash

set -e

mkdir -p $HOME/.local/share
PEARL_ROOT=$HOME/.local/share/pearl
PEARL_HOME=$HOME/.config/pearl

[ -d "$PEARL_ROOT" ] && { echo "Error: Pearl seems already installed in $PEARL_ROOT. Remove the directory in order to proceed with the installation."; exit 1; }

echo "* Downloading Pearl to $PEARL_ROOT"
git clone --quiet 'https://github.com/pearl-core/pearl.git' $PEARL_ROOT

source $PEARL_ROOT/lib/utils.sh

bold_white; echo -n "* "; normal; echo "Creating Pearl configuration in $PEARL_HOME"
mkdir -p $PEARL_HOME/repos
mkdir -p $PEARL_HOME/packages

[ -e "$PEARL_HOME/pearl.conf" ] || cp "$PEARL_ROOT/etc/pearl.conf.template" "$PEARL_HOME/pearl.conf"

apply "source ${PEARL_ROOT}/boot/pearl.sh" ${HOME}/.bashrc
apply "export PEARL_ROOT=${PEARL_ROOT}" ${HOME}/.bashrc
bold_white; echo -n "* "; normal; echo "Activated Pearl for Bash"
apply "source ${PEARL_ROOT}/boot/pearl.sh" ${HOME}/.zshrc
apply "export PEARL_ROOT=${PEARL_ROOT}" ${HOME}/.zshrc
bold_white; echo -n "* "; normal; echo "Activated Pearl for Zsh"
apply "source ${PEARL_ROOT}/boot/pearl.fish" ${HOME}/.config/fish/config.fish
apply "set -x PEARL_ROOT ${PEARL_ROOT}" ${HOME}/.config/fish/config.fish
bold_white; echo -n "* "; normal; echo "Activated Pearl for Fish shell"
apply "source ${PEARL_ROOT}/boot/vim/pearl.vim" ${HOME}/.vimrc
bold_white; echo -n "* "; normal; echo "Activated Pearl for Vim editor"
info ""
info "Done! Open a new terminal and have fun!"
info ""
info "To get the list of Pearl packages available:"
echo "    >> pearl list"
