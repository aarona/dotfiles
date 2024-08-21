#!/bin/bash

# Check if user has access to sudo
if ! command -v sudo &> /dev/null; then
  echo "Sudo is not installed and is required to install other packages. Cannot continue."
  exit 1
fi

# Check if git is installed
if ! command -v git &> /dev/null; then
  echo "Git is not installed. Attempting to install Git..."

  # Use apt to install git
  if command -v apt &> /dev/null; then
    sudo apt update
    sudo apt install -y git
  else
    echo "Cannot install Git automatically using apt. Please install Git manually and run this script again."
    exit 1
  fi

  # Check again if git is installed after attempting to install
  if ! command -v git &> /dev/null; then
    echo "Git installation failed. Please install Git manually and run this script again."
    exit 1
  fi
fi

# Bare minimum needed to compile and gather resources from the web
sudo apt install -y build-essential

# Downloading dotfiles
git clone https://github.com/aarona/dotfiles.git ~/dotfiles

# Install the Zsh shell and oh-my-zsh plugin
sudo apt install -y zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Chaning shell to Zsh. Password required."
chsh -s $(which zsh)

# Prompt for logging out to let chsh take place
read -p "Logout to finish install Zsh? [Yn] " response
case $response in
  [Yy]*|"" ) logout;;
  * ) echo "Be sure to logout to finishing installing Zsh";;
esac

