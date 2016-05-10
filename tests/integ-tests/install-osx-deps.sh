#!/bin/sh
set -ex

brew update
brew install coreutils

./tests/integ-tests/install-bash.sh "$TRAVIS_BASH_VERSION"
sudo rm -f /bin/bash
sudo ln -s /usr/local/bin/bash /bin/bash

echo "PATH=/usr/local/opt/coreutils/libexec/gnubin:\$PATH" >> ${HOME}/.bashrc

./tests/integ-tests/install-git.sh "$TRAVIS_GIT_VERSION"

