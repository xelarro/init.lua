#!/bin/env bash

set -eou pipefail

sudo apt update && sudo apt install -y ripgrep jq

cd $HOME

NEOVIM_URL=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | jq -r '.assets[] | select(.name == "nvim-linux64.tar.gz") | .browser_download_url')

wget --quiet ${NEOVIM_URL} -O /tmp/nvim-linux64.tar.gz
tar -xavf /tmp/nvim-linux64.tar.gz -C $HOME/
sudo ln -s $HOME/nvim-linux64/bin/nvim /usr/bin/nvim
