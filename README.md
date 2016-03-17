# dotfiles

Here are my dotfiles, an attempt to make process of setting up new machine less painful.

The whole process consist of three parts:
- Manually install some applications / set some defaults.
- Run scripts to install most of the important stuff, like MacPorts, Python etc.
- Link dotfiles from this repository to dotfiles in my home folder.

## Start here
First things first: install Xcode:
```
sudo softwareupdate -i -a
xcode-select --install
```
Or just install Xcode from Apple store and
```
sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer/
```

## Git
Obviously, we will need [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) to proceed.

## Installation scripts
Next, copy the repository and run installation script:
```
git clone https://github.com/mfedoten/dotfiles
cd dotfiles/bin
```
Below is description of the installation steps, listed in the order as they should be executed. All scripts are in the `bin` directory.

### MacPorts and packages
`./bin/ports.sh`: installs [MacPorts](https://www.macports.org/) and all packages listed in `portnames.txt`.

### Upgrade bash
`./bin/bash_update.sh`: installs and sets the latest version of bash. It's not really necessary, but some useful features (like auto-completion), won't work on bash versions older than 4.

### Python
`./bin/python.sh` will set up Python and pip to run MacPorts version and install all packages from `requirements.txt`.

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
### MacVim
`./bin/macvim.sh`: compiles MacVim with Python support, installs [Vundle](https://github.com/VundleVim/Vundle.vim) and all plugins listed in `~/.vimrc`. The script also installs [pre-patched fonts for Powerline](https://github.com/powerline/fonts) to work with [vim-airline](https://github.com/bling/vim-airline), you just have to specify the right font in your terminal settings after installation. I'm using a plugin to toggle mouse between vim and Terminal, but it won't work anyway because of known issues of Terminal. To fix it [MouseTerm](https://bitheap.org/mouseterm/) should be installed.

The script searches for location of config directory of current python's version and passes it `--with-python-config-dir` switch during the installation of MacVim, but it might fail. Also if MacVim is already installed it does not update it, it just proceeds to Vundle installation (I have to fix this).

If you get clang error, try uncommenting line 28:
```
export LDFLAGS=-L/usr/lib
```

### iTerm2
`./bin/term.sh` will install [iTerm2](https://www.iterm2.com/).

### OSX defaults
Normally, I prefer to set up appearance and defaults manually, but this script sets some nice defaults which I am too lazy to search for in the system preferences. It also sets Terminal/iTerm colors to [Solarized theme](http://ethanschoonover.com/solarized), printing full path in heading of Finder windows etc. Just:
```
./bin/osx.sh
```

### Git status
I found this amazing python script called [show_status](http://blog.mikepearce.net/2010/06/16/git-status-on-multiple-repos/). It will show git status of all git repositories under current dir. The script `./bin/git_show_status.sh` will download this script from its [github repo](https://github.com/MikePearce/Git-Status) and install it to `/usr/local/bin/`.


### Warning
All this scripts worked fine for me, but might not work on your machine, so proceed with care. Never copy anything blindly, check what is inside and adjust to your needs. Each script will exit if as soon as any command in the scrip fails. If you want to see what it's doing, in the beginning of each script (around `line 8`) you should find the following:
```
set -e
```
change it to:
```
set -ex
```
Like that the script will output each command it's executing prepended with pluses.

And once again: **be careful!**

## Other programs
Here are some other programs I have on my machine. They require mostly manual installation, which pretty straightforward. I also included links to download pages / instructions how to install.

* [MacTex](https://tug.org/mactex/). I prefer manual installation from [here](https://tug.org/mactex/mactex-download.html). It will install TexLive to `/usr/local/` and add `/Applications/TeX` with some GUI programs like BibDesk, TeXShop etc., which can be uninstalled if not needed.
* [Google Chrome](https://www.google.com/chrome/browser/desktop/) and [Firefox](https://www.mozilla.org/en-US/firefox/new/).
* [Acrobat Reader](https://get.adobe.com/reader/) to view `pdf` files and [Skim](http://skim-app.sourceforge.net/) to work with latex: latexmk constant preview + Skim is a killer.
* [Dropbox](https://www.dropbox.com/install) for quick shares.
* To work with LaTex document normally I use Vim + [LaTeX-Box](https://github.com/LaTeX-Box-Team/LaTeX-Box) + [Skim](http://skim-app.sourceforge.net/), but if I need GUI I prefer [TexStudio](http://www.texstudio.org/) or [TexMaker](http://www.xm1math.net/texmaker/download.html#macosx).
* [Zotero](https://www.zotero.org/download/) as bibliography manager **+** [Better Bib(La)TeX](https://github.com/ZotPlus/zotero-better-bibtex) for decent citation export.
* [Jumpcut](http://jumpcut.sourceforge.net/) is a small but useful tool to keep your Cut/Copy history.
* [TexMate](http://macromates.com/download) as alternative to Vim.
* [DefaltApp](http://www.rubicode.com/Software/Bundles.html#RCDefaultApp) very usefull if you want to set default app for a group of different files, instead of "Get info" for each specific filetype you can configure all filetypes, which should be open with a particular app.

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

## TODO
- Add possibility of update in `macmvim.sh`.
- Fix directories installation for backups in `install.sh`.
- Make cleaning in `install.sh` more flexible, e.g. add possibility to specify directories to clean, make it as a separate command.
- More 'sophisticated' way of managing local configuration.
