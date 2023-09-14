#!/bin/bash

#TODO: Homebrew?
echo -e "\n03 - Setup Python Environment"

echo -e "03.01 - Install Apt Packages"
# Install Apt Packages for pyenv
sudo apt-get install -y \
	git \
	build-essential libssl-dev zlib1g-dev \
	libbz2-dev libreadline-dev libsqlite3-dev \
	curl libncursesw5-dev xz-utils tk-dev \
	libxml2-dev libxmlsec1-dev libffi-dev \
	liblzma-dev \
	python3 python3-pip python3-venv

if [ ! -d "$HOME/.pyenv" ]; then
  echo -e "\n03.02 - Install pyenv"
  curl https://pyenv.run | bash
fi

echo -e "\n03.03 - Install python versions"
pyenv install -s 3.8 3.10 3.11

echo -e "\n03.04 - set default python interpreter"
pyenv global 3.11

echo -e "\n03.05 - Install pipx"
python3 -m pip install --user pipx

echo -e "\n03.06 - Install pipx packages"
~/.local/bin/pipx install poetry
~/.local/bin/pipx install black
~/.local/bin/pipx install codespell
~/.local/bin/pipx install commitizen
~/.local/bin/pipx install ruff
~/.local/bin/pipx install poethepoet
~/.local/bin/pipx install tox
~/.local/bin/pipx install pre-commit
~/.local/bin/pipx install pygments
~/.local/bin/pipx install thefuck
~/.local/bin/pipx install yq
~/.local/bin/pipx install asciinema
