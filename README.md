# Dotfiles Project

My first attempt at version controlling my dotfiles, with a non-bare Git repo in my user directory, and a `.gitignore` of `*`. See https://drewdevault.com/2019/12/30/dotfiles.html for details and inspiration. Deprecated in favor of a bare repo. That project can be found [here](https://github.com/kvnloughead/dotfiles).

## Setup instructions

```
cd ~
git init
git remote add origin https://github.com/kvnloughead/dotfiles
git fetch
git checkout -f main
```
