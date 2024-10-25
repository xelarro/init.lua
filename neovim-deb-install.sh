#!/bin/env bash

set -eou pipefail

if [[ $(id -u 2>/dev/null) -ne 0 ]]; then
	sudo apt update && sudo apt install -y ripgrep jq curl wget unzip gcc
else
	apt update && apt install -y ripgrep jq curl wget unzip gcc
fi


cd $HOME

NEOVIM_URL=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | jq -r '.assets[] | select(.name == "nvim-linux64.tar.gz") | .browser_download_url')

wget --quiet ${NEOVIM_URL} -O /tmp/nvim-linux64.tar.gz
tar -xavf /tmp/nvim-linux64.tar.gz -C $HOME/
if [[ $(id -u 2>/dev/null) -ne 0 ]]; then
	sudo ln -s $HOME/nvim-linux64/bin/nvim /usr/bin/nvim
else
	ln -s $HOME/nvim-linux64/bin/nvim /usr/bin/nvim
fi
