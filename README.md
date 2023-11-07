# Setup dotfiles

```zsh
cd ~
ssh-keygen -o -t ed25519

git clone git@github.com:JeewonHeo/.dotfiles.git
```

## setup zsh
```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
mv ~/.zshrc ~/.zshrc_backup
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
```

## nvim
```zsh 
mkdir ~/.local/bin
cd ~/.local/bin 
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
cd - 
```

