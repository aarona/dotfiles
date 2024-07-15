#### Install

```bash
sudo apt install -y wget curl git zsh stow
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv ~/.zshrc ~/.zshrc.bak
git clone https://github.com/aarona/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow .
source ~/.zshrc
```
