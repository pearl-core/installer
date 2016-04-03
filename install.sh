#!/bin/bash

set -e

mkdir -p $HOME/.local/share
export PEARL_ROOT=$HOME/.local/share/pearl
export PEARL_HOME=$HOME/.config/pearl

[ -d "$PEARL_ROOT" ] && { echo "Error: Pearl seems already installed in $PEARL_ROOT. Remove the directory in order to proceed with the installation."; exit 1; }

echo "* Downloading Pearl to $PEARL_ROOT"
git clone --quiet 'https://github.com/pearl-core/pearl.git' $PEARL_ROOT

$PEARL_ROOT/bin/pearl init
