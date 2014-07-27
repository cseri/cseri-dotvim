#My Vim settings

These are settings for Vim.

#Usage

##Installation

Step 1: Clone the project to the `~/.vim` directory (`~/vimfiles` on Windows)

Step 2: Symlink the `vimrc` in the repo root to `~/.vimrc`

Step 3: initialize submodules to load plugins.

Commands to do the above on Linux:

```bash
git clone https://github.com/cseri/cseri-dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
```

## Update all bundled modules

```bash
git submodule foreach git pull origin master
```

## Install a new bundle

```bash
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."
```

## To remove a submodule

1. Delete the relevant section from the .gitmodules file.
2. Delete the relevant section from .git/config.
3. Run git rm --cached path_to_submodule (no trailing slash).
4. Commit and delete the now untracked submodule files.

#Credits

Based on many `.vimrc`s found on the Internet and the `.vimrc` of Dutow and Sztupy.

Packaging ideas from here: [Synchronizing plugins with git submodules and pathogen](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/)

Instructions in README from here: [Dudarev's dotvim repo on GitHub](https://github.com/dudarev/dotvim)


