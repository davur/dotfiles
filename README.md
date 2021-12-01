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
git remote add origin https://github.com/davur/dotfiles.git
git pull origin master
```

Add new dotfiles
----------------

This repo is intended to live in the user's root directory. A ignore-all `*` 
.gitignore file is added to reduce `git status` noise.

So to track a new dotfile in this repo, use `git add --force FILENAME`.

Stats
-----

[![Top Langs](https://github-readme-stats.vercel.app/api/top-langs/?username=davur&layout=compact)](https://github.com/anuraghazra/github-readme-stats)

