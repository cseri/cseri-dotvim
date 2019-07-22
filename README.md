# My Vim settings

These are settings for Vim.

I've made these public to easily share them between my machines, not for using
them directly by others. Everyone should have their own settings for their own
Vim usage style.

However, one might always find interesting options/solutions in others' Vim
settings.

## Usage

### Installation

1. Clone the project to the `~/.vim` directory (`~/vimfiles` on Windows)
1. Symlink the `vimrc` in the repo root to `~/.vimrc`
1. initialize submodules to load plugins.

Commands to do the above on Linux:

```bash
git clone https://github.com/cseri/cseri-dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
```

Commands to do the above on Windows:
```bat
C:
cd %USERPROFILE%
git clone https://github.com/cseri/cseri-dotvim.git vimfiles
cd vimfiles
git submodule init
git submodule update
```

and create the link as administrator
```bat
C:
cd %USERPROFILE%
mklink .vimrc vimfiles\vimrc
```

### Updating

Just pull and update the submodules.

```bash
git submodule init
git submodule update
```

## Handling modules

Plugins are handled via submodules. This allows them to stay up-to-date without
manual work. Even `pathogen` has its own submodule.

### Update all bundled modules

```bash
git submodule foreach git pull origin master
```

### Install a new bundle

```bash
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."
```

### To remove a submodule

1. Delete the relevant section from the .gitmodules file.
2. Delete the relevant section from .git/config.
3. Run git rm --cached path_to_submodule (no trailing slash).
4. Commit and delete the now untracked submodule files.

## Credits

Based on many `.vimrc`s found on the Internet and the `.vimrc` of Dutow and
Sztupy.

Packaging ideas from here:
[Synchronizing plugins with git submodules and pathogen](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/)

Instructions in README from here:
[Dudarev's dotvim repo on GitHub](https://github.com/dudarev/dotvim)


