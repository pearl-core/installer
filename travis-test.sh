#!/bin/bash

set -ex

./install.sh

test -d "$HOME/.config/pearl"
test -d "$HOME/.local/share/pearl"

source $HOME/.bashrc

test -d "$PEARL_ROOT"
test -d "$PEARL_HOME"
test -d "$PEARL_TEMPORARY"
