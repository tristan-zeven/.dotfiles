# Manage dotfiles without symlinks

## First time setup
```
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'  # Put this alias in .bashrc or .zshrc to make it permanent.
dotfiles config --local status.showUntrackedFiles no
dotfiles remote add origin git@github.com:tristan-zeven/.dotfiles.git
```

### Operations
```
cd $HOME
dotfiles add <filename>
dotfiles commit -m "Add <filename>"
dotfiles push
```

## New machine setup
To setup a new machine, clone this repo to a temporary directory. This is because you might have some default config files in your $HOME which will cause a normal clone to fail.
```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/tristan-zeven/.dotfiles.git tmpdotfiles
rsync -rv --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
```
