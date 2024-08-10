#!/bin/bash

# Install Core development libraries
sudo apt install -y curl libcurl4-openssl-dev libssl-dev libyaml-dev libz-dev openssl zlib1g-dev

# Install asdf and language plugins
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
asdf update
asdf plugin add ruby
asdf plugin add nodejs
asdf plugin add yarn
asdf plugin add perl
asdf install
