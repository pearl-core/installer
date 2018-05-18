#!/usr/bin/env bash

set -e

[[ -n "$1" ]] && branch="--branch $1" || unset branch

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
mkdir -p "$XDG_CONFIG_HOME"
mkdir -p "$XDG_DATA_HOME"
export PEARL_HOME="$XDG_CONFIG_HOME/pearl"
export PEARL_ROOT="$XDG_DATA_HOME/pearl"

if [[ -e "$PEARL_ROOT" ]]; then
	printf '%s' "Error: It seems Pearl is already installed in $PEARL_ROOT."
	printf '%s\n' ' Remove the directory to proceed with the installation.'
	exit 11
fi

echo "* Downloading Pearl to $PEARL_ROOT"
git clone --quiet $branch --depth 1  --recurse-submodules \
	'https://github.com/pearl-core/pearl.git' "$PEARL_ROOT"

"$PEARL_ROOT/bin/pearl" init
