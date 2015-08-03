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
cd dotfiles/install
```
Below is description of the installation steps, listed in the order as they should be executed. All scripts are in the `bin` directory.

### MacPorts and packages
`ports.sh`: installs [MacPorts](https://www.macports.org/) and all packages listed in `portnames.txt`.

### Upgrade bash
`bash_update.sh`: installs and sets the latest version of bash. It's not really necessary, but some useful features (like auto-completion), won't work on bash versions older than 4.

### Python
`python.sh` will set up Python and pip to run MacPorts version and install all packages from `packages.txt`.

### Dotfiles
Next, we need to symlink all files in `home` directory. To do so I am using [Dotbot](https://github.com/anishathalye/dotbot#configuration), which is just great: it's clean, lightweight and simple. Detailed information can be found on the page of the project, but in few words the idea is the following:
- you add it as a submodule to your repo;
- you define which files in your repo should be lined to which files in your home repository in `install.conf.yaml`;
- you run `./install` script;

Now, you're all set but there are some details to keep in mind, for instance you want to keep your home directory clean from broken links, [Dotbot](https://github.com/anishathalye/dotbot#configuration) can do that for you, just go and check their page.

I also prefer to have some "local" configuration, specific to each machine (e.g. `PATH` might be different). To do so I keep them locally on each machine, append `_local` to the names and add this suffix to `.gitignore`, that way they are still linked, but not overwritten. Ok, I understand that it's not the best way to do version control and that there are more [sophisticated ways](http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/#local-customization). Maybe later I'll fix this.

### MacVim
`macvim.sh`: compiles MacVim with Python support, installs [Vundle](https://github.com/VundleVim/Vundle.vim) and all plugins listed in `~/.vimrc`. That's why it's better to symlink dotfiles first, otherwise you can afterwards install the plugins from Vim with `:PluginInstall`. The script also installs [pre-patched fonts for Powerline](https://github.com/powerline/fonts) to work with [vim-airline](https://github.com/bling/vim-airline), you just have to specify the right font in your terminal settings after installation. I'm using a plugin to toggle mouse between vim and Terminal, but it won't work anyway because of known issues of Terminal. To fix it [MouseTerm](https://bitheap.org/mouseterm/) should be installed.

The script searches for location of config directory of current python's version and passes it `--with-python-config-dir` switch during the installation of MacVim, but it might fail. Also if MacVim is already installed it does not update it, it just proceed to Vundle installation (I have to fix this).

### iTerm2
`term.sh` will install [iTerm2](https://www.iterm2.com/).

### OSX defaults
Normally, I prefer to set up appearance and defaults manually, but this script sets some nice defaults which I am too lazy to search for in system preferences. It also sets Terminal/iTerm colors to [Solarized theme](http://ethanschoonover.com/solarized)

### MacTex
Install Mac version of TexLive. I prefer manual installation from [here](https://tug.org/mactex/mactex-download.html). It will install TexLive to `/usr/local/` and add `/Applications/TeX` with some GUI programs like BibDesk, TeXShop etc., which can be uninstalled if not needed.


## Other programs I have installed
* [Google Chrome](https://www.google.com/chrome/browser/desktop/)
* [Acrobat Reader](https://get.adobe.com/reader/) to view `pdf` files and [Skim](http://skim-app.sourceforge.net/) to work with latex: latexmk constant preview + Skim is a killer.


## TODO
- Add possibility of update in `macmvim.sh`.
- More sophisticated way of managing local configuration.
