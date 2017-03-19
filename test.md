### Vim
Again several options:
* `sudo apt-get install vim`, but usually it installs older versions.
* PPA, for example see [here](http://tipsonubuntu.com/2016/09/13/vim-8-0-released-install-ubuntu-16-04/) but check that it was compiled with desired options (e.g. python, ruby, etc.)
* Compile from source ([instructions](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source) and [one more](https://gist.github.com/odiumediae/3b22d09b62e9acb7788baf6fdbb77cf8)). It's a good idea to use `sudo checkinstall` instead of `sudo make install`, then you can easily deinstall your vim with `dpkg -r [compiled-vim]`.
**P.S.** when compiling vim with both python2 and python3, well [they don't play nicely](http://stackoverflow.com/a/23656675), so you'll probably have to choose either of them. Or [google it](http://unix.stackexchange.com/questions/305415/enabling-python3-on-vim-in-fedora-24).

Once vim is installed, run `./init/vim.sh` to install all plugins and also download and install patched fonts for `vim-powerline`.


### Extras
#### Git status
I found this amazing python script called [show_status](http://blog.mikepearce.net/2010/06/16/git-status-on-multiple-repos/). It will show git status of all git repositories under current dir. The script `./init/git_show_status.sh` will download this script from its [github repo](https://github.com/MikePearce/Git-Status) and install it to `/usr/local/bin/`.

#### The Fuck
Just type `sudo apt install python3-dev python3-pip; pip3 install --user thefuck`. Put `eval $(thefuck --alias)` in your `~/.bashrc` or `~/.bash/aliases.bash` or whereever you store your aliases.
You can read more on the [GitHub page](https://github.com/nvbn/thefuck).



## Dotfiles
Next, we need to symlink all files in `home` directory. I am using custom script, which links files and asks user about backup. There are several scenarios:
- file already exist and is linked to a dotfile in your repository -> nothing happens.
- file exists and it is identical to your dotfiles -> file is replaced with symlink, no backup.
- file exist and differs from your dotfile -> file is symlinked to your dotfile, user is prompted to confirm backup.
- file doesn't exist -> symbolic link is created.

The script is mostly based on Simon Eskildsen's [linker.sh script](https://github.com/Sirupsen/dotfiles/blob/master/linker.sh), which is totally great. I just added few modifications.

First one is files backup. And second is that this script copies files recursively, instead of just linking the whole folder and overwriting its contents. I decided to do so because I prefer to have some "local" configuration, specific to each machine (e.g. `PATH` might be different). To do so I keep them locally on each machine, append `_local` to the names and add this suffix to `.gitignore`, that way they are still linked, but not overwritten. Ok, I understand that it's not the best way to do version control and that there are more [sophisticated ways](http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/#local-customization). Maybe later I'll fix this, one day, I guess.. Another fix I want to do is to think of the way how to create backup directories at the moment of backup. For now it creates `backups` directory with all subfolders in the very beginning. It's done so that structure of `~` would be preserved and dotfiles wouldn't just be scattered over `backups` dir.

Before linking files from you repository the scripts first checks dotfiles in your home `~/` directory for broken links and deletes them.

To link all dotfiles in your repository just type in:
```
./install.sh
```

## Warning
All this scripts worked fine for me, but might not work on your machine, so proceed with care. Never copy anything blindly, check what is inside and adjust to your needs. Each script will exit if as soon as any command in the scrip fails. If you want to see what it's doing, in the beginning of each script (around `line 8`) you should find the following:
```
set -e
```
change it to:
```
set -ex
```
Like that the script will output each command it's executing prepended with pluses.

## Other programs
Here are some other programs I've installed from Ubuntu Software or from their websites.

* [Chromium](https://www.chromium.org/getting-involved/download-chromium)
* [Okular](https://okular.kde.org/) to view `pdf` files.
* [Dropbox](https://www.dropbox.com/install) for quick shares.
* [Zotero](https://www.zotero.org/download/) as bibliography manager **+** [Better Bib(La)TeX](https://github.com/ZotPlus/zotero-better-bibtex) for decent citation export.
* [PyCharm](https://www.jetbrains.com/pycharm/) as alternative to Vim, especially for debugging Python.


## Further reading
If you don't know where to start, what all this mean, what the hell dotfiles are etc. Here are some resources and examples:
* [A nice introduction on dotfiles.](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789)
* [A good post on managing your dotfiles.](http://www.anishathalye.com/2014/08/03/managing-your-dotfiles)
* [Github's huge collection of resources.](https://dotfiles.github.io/)
* Here are some dotfiles repositories which inspired this repo:
    - [Simon Eskildsen](https://github.com/Sirupsen/dotfiles/)
    - [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
    - [Steve Losh](https://bitbucket.org/sjl/dotfiles/src)
    - [Lars Kappert](https://github.com/webpro/dotfiles)
    - [cowboy](https://github.com/cowboy/dotfiles)

## TODO
* diff tool
* find a way to execute vim's command in another terminal
* colors for terminal
* redo the structure: share with mac branch

