# dotfiles

## Installation

### Git
Obviously, we will need [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

### Installation script
On a brand new Mac we will need XCode.
```
sudo softwareupdate -i -a
xcode-select --install
```
Next, copy the repository and run installation script.
```
git clone https://github.com/mfedoten/dotfiles
cd dotfiles
./install.sh
```
This script will:
- install [MacPorts](https://www.macports.org/)
- install all packages listed in
- install Python and pip with MacPorts
- compile MacVim with Python support
- install [Vundle](https://github.com/VundleVim/Vundle.vim)
- install [pre-patched fonts](https://github.com/powerline/fonts) for vim-airline
- instal MacTex to `/usr/local`

### Dotfiles
Next, we need to symlink all files in `home` directory
```
./linker.sh
```

### OSX defaults
Normally, I prefer to set up appearance and defaults manually, but this script sets some nice defaults which I am too lazy to search for. It also sets Terminal/iTerm colors to [Solarized theme](http://ethanschoonover.com/solarized)

## Other programs I have installed
* [Google Chrome](https://www.google.com/chrome/browser/desktop/)
