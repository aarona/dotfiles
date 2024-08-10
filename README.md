#### Install

```bash
# Install Core development libraries, the Zsh shell and oh-my-zsh plugin
sudo apt install -y build-essential curl git libcurl4-openssl-dev libssl-dev libyaml-dev libz-dev openssl wget zlib1g-dev zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)

# force logout to take shell change affect
while true; do
  read -p "Logout to finish install Zsh? [Yn] " yn
  case $yn in
    [Yy]*|"" ) echo "logging out"; break;;
    * ) break;;
  esac
done
```

```bash
# Install dotfiles and stow them
sudo apt install -y stow
mv -i ~/.bash_logout{,.bak}
mv -i ~/.bashrc{,.bak}
mv -i ~/.profile{,.bak}
mv -i ~/.zshrc{,.bak}
mv -i ~/.zlogin{,.bak}
mv -i ~/.zlogout{,bak}
git clone https://github.com/aarona/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow .
source ~/.zshrc
cd -
```

```bash
# Install asdf and language plugins
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
asdf update
asdf plugin add ruby
asdf plugin add nodejs
asdf plugin add yarn
asdf plugin add perl
```
