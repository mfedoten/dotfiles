# dotfiles

Here are my dotfiles, an attempt to make process of setting up new machine less painful.

The whole process consist of three parts:
- Manually install some applications / set some defaults.
- Run scripts to install some of the important stuff, like MacPorts/APT packages, Python etc.
- Link dotfiles from this repository to dotfiles in my home folder.

## Start here
Download this repo and follow the instruction below to start setting your environment. These instructions differ slightly for Linux and OSX, so choose the one below.

### OSX
First things first: install Xcode:
```
sudo softwareupdate -i -a
xcode-select --install
```
Or just install Xcode from Apple store and
```
sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer/
```

#### MacPorts
Next, download and install MacPorts from [here](https://www.macports.org/install.php). After that, run `./init/01_osx_ports.sh` to install all required ports listed in `portnames.txt`.

#### Upgrade bash
Depending on the bash shipped with your system, it might be outdated. In order to update it, set a desired version of bash in `./init/bash_update.sh` and then just run the script. It's not really necessary, but some useful features (like auto-completion in vim), won't work on bash versions older than 4.

#### iTerm2
Switching from Terminal to [iTerm2](https://www.iterm2.com/) is a good idea.

#### OSX defaults
`./init/03_osx_defaults.sh` sets some nice default settings. It also sets Terminal/iTerm colors to [Solarized theme](http://ethanschoonover.com/solarized), printing full path in heading of Finder windows etc.

### Ubuntu

#### APT packages
Running `./init/01_ubuntu_apt.sh` will update APT and installs all packages listed in `init/packages.txt`. Or you can always install the packages manually.

## Git
After all packages were installed, it's a good idea to configure git.

P.S. on Ubuntu you might want to install a more recent version of git via [PPA](https://launchpad.net/~git-core/+archive/ubuntu/ppa).

Add your credentials:
```
git config --global user.name "Your Name"
git config --global user.email yourname@example.com
```
Check if you have SSH installed:
```
ssh -V
```
Generate a new SSH key if you don't have one already:
```
ssh-keygen
# on Linux
cat ~/.ssh/id_rsa.pub | xclip -sel clip
# on Mac
cat ~/.ssh/id_rsa.pub | pbcopy
```
And now add it to the [list of recognized keys](https://github.com/settings/keys).


## Python
There are several ways to install Python:
* Install with [Anaconda](https://docs.continuum.io/anaconda/).
* Install using package managers. **On Ubuntu** using `apt-get` (see [this example](https://www.digitalocean.com/community/tutorials/how-to-install-python-3-and-set-up-a-local-programming-environment-on-ubuntu-16-04). The problem here is that usually it contains older version of Python, but you can try to install it with PPA (an [example](http://askubuntu.com/questions/865554/how-do-i-install-python-3-6-using-apt-get)). **On OSX** you can easily install it with MacPorts. You can run `./init/40_osx_python.sh` to install Python 2.7 and Python 3.6, it also sets `python36` as default `python` and installs pip and PyQt5. **P.S** to check which Python version pip is using run `pip -V`.
* **Ubuntu:** compile from source. Look [here](https://tecadmin.net/install-python-3-6-ubuntu-linuxmint/), [here](http://stackoverflow.com/questions/8097161/how-would-i-build-python-myself-from-source-code-on-ubuntu), and [here](https://docs.python.org/2/using/unix.html), good luck! **OSX:** install from official [Python's website](https://www.python.org/downloads/)

After finally installing Python and checking that it works without crashing your system, you can now run `./init/50_pip.sh` which will install all packages (+ notebook extensions) from `pip-packages.txt`.

## Vim
You can always find the latest(-ish) version of vim either through package manager or form official repo.
In case you want to compile it manually, here's what you ought to do. Run either `./init/50_osx_vim.sh` or `./init/50_ubuntu_vim.sh` based on your system. **Don't forget to change Python's config dir to match your python**. More info on how to compile vim from source on OSX can be found [here](http://tartley.com/?p=1355), for Ubuntu check [here](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source) and [here](https://gist.github.com/odiumediae/3b22d09b62e9acb7788baf6fdbb77cf8). On Ubuntu it's a good idea to use `sudo checkinstall` instead of `sudo make install`, then you can easily deinstall your vim with `dpkg -r [compiled-vim]` and don't forget to change package's name to something meaningfull when checkinstall asks you to.

**P.S.** when compiling vim with both python2 and python3, well [they don't play nicely](http://stackoverflow.com/a/23656675), so you'll probably have to choose either of them. Or [google it](http://unix.stackexchange.com/questions/305415/enabling-python3-on-vim-in-fedora-24).

Now that you have your Vim/MacVim successfully installed, we should install all of our precious plugins through `./init/51_vundle.sh`. What it does, it installs [Vundle](https://github.com/VundleVim/Vundle.vim) and all plugins listed in `~/.vimrc`. The script also installs [pre-patched fonts for Powerline](https://github.com/powerline/fonts) to work with [vim-airline](https://github.com/bling/vim-airline), you just have to specify the right font in your terminal/iTerm/MacVim etc. settings after installation.


## Extras

### Git status
I found this amazing python script called [show_status](http://blog.mikepearce.net/2010/06/16/git-status-on-multiple-repos/). It will show git status of all git repositories under current dir. The script `./init/60_git_show_status.sh` will download this script from its [github repo](https://github.com/MikePearce/Git-Status) and install it to `/usr/local/bin/`.

### The Fuck
Just type `sudo -H pip install thefuck`. Put `eval $(thefuck --alias)` in your `~/.bashrc` or `~/.bash/aliases.bash` or wherever you store your aliases. You can read more on the [GitHub page](https://github.com/nvbn/thefuck).

### Terminal colors
`term_colors/` contains different colors for Terminal, iTerm, and konsole.


### Dotfiles
Next, we need to symlink all files in `home` directory. To do so I at first was using [Dotbot](https://github.com/anishathalye/dotbot#configuration), which is just great: it's clean, lightweight and simple. For more information visit [Dotbot page](https://github.com/anishathalye/dotbot#configuration).

The problem with Dotbot is that it doesn't backup dotfiles in home directory. Instead I decided to use custom script, which always links files but ask user for backup. There are several scenarios:
- file already exist and is linked to a dotfile in your repository -> nothing happens.
- file exists and it is identical to your dotfiles -> file is replaced with symlink, no backup.
- file exist and differs from your dotfile -> file is symlinked to your dotfile, user is prompted to confirm backup.
- file doesn't exist -> symbolic link is created.

The script is mostly based on Simon Eskildsen's [linker.sh script](https://github.com/Sirupsen/dotfiles/blob/master/linker.sh), which is totally great. I just added two modifications.

First one is files backup. And second is that this script copies files recursively, instead of just linking the whole folder and overwriting its contents. I decided to do so because I prefer to have some "local" configuration, specific to each machine (e.g. `PATH` might be different). To do so I keep them locally on each machine, append `_local` to the names and add this suffix to `.gitignore`, that way they are still linked, but not overwritten. Ok, I understand that it's not the best way to do version control and that there are more [sophisticated ways](http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/#local-customization). Maybe later I'll fix this, one day, I guess.. Another fix I want to do is to think of the way how to create backup directories at the moment of backup. For now it creates `backups` directory with all subfolders in the very beginning. It's done so that structure of `~` would be preserved and dotfiles wouldn't just be scattered over `backups` dir.

Before linking files from you repository the scripts first checks dotfiles in your home `~/` directory for broken links and deletes them.

To link all dotfiles in your repository just type in:
```
./install.sh
```

## Warning
All this scripts worked fine for me, but might not work on your machine, so proceed with care. Never copy anything blindly, check what is inside and adjust to your needs. Each script will exit as soon as any command in the scrip fails. If you want to see what it's doing, in the beginning of each script (around `line 8`) you should find the following:
```
set -e
```
change it to:
```
set -ex
```
Like that the script will output each command it's executing prepended with pluses.

## Other programs
Here are some other programs I have on my machine. They require mostly manual installation, which pretty straightforward. I also included links to download pages / instructions how to install.

### OSX
* [MacTex](https://tug.org/mactex/). I prefer manual installation from [here](https://tug.org/mactex/mactex-download.html). It will install TexLive to `/usr/local/` and add `/Applications/TeX` with some GUI programs like BibDesk, TeXShop etc., which can be uninstalled if not needed.
* [Google Chrome](https://www.google.com/chrome/browser/desktop/) and [Firefox](https://www.mozilla.org/en-US/firefox/new/).
* [Acrobat Reader](https://get.adobe.com/reader/) to view `pdf` files and [Skim](http://skim-app.sourceforge.net/) to work with latex: latexmk constant preview + Skim is a killer.
* [Dropbox](https://www.dropbox.com/install) for quick shares.
* To work with LaTex document normally I use Vim + [LaTeX-Box](https://github.com/LaTeX-Box-Team/LaTeX-Box) + [Skim](http://skim-app.sourceforge.net/), but if I need GUI I prefer [TexStudio](http://www.texstudio.org/) or [TexMaker](http://www.xm1math.net/texmaker/download.html#macosx).
* [Zotero](https://www.zotero.org/download/) as bibliography manager **+** [Better Bib(La)TeX](https://github.com/ZotPlus/zotero-better-bibtex) for decent citation export.
* [Jumpcut](http://jumpcut.sourceforge.net/) is a small but useful tool to keep your Cut/Copy history.
* [TexMate](http://macromates.com/download) as alternative to Vim.
* [DefaltApp](http://www.rubicode.com/Software/Bundles.html#RCDefaultApp) very usefull if you want to set default app for a group of different files, instead of "Get info" for each specific filetype you can configure all filetypes, which should be open with a particular app.

### Ubuntu
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
    - [cowboy](https://github.com/cowboy/dotfiles)
    - [Lars Kappert](https://github.com/webpro/dotfiles)

## TODO
- tmux config
- install local files from here
