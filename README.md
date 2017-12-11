dotfiles
========

Some of my local configuration files

Backup
------

```
mkdir dotfiles_backup
mv .bash_profile .gitconfig .gitignore_global .gvimrc .inputrc .vimrc README.md ./dotfiles_backup/
```

Installation
------------

```
cd ~
git init .
git remote add origin https://github.com/dsclementsen/dotfiles.git
git pull origin master
```
