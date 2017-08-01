# dotfiles

Here are my dotfiles, an attempt to make process of setting up new machine less painful.

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

#### HomeBrew
Next, run `./init/10_osx_homebrew.sh` to download and install Homebrew and all the packages`. `./init/11_osx_brew_casks.sh` will install the casks.

#### Upgrade bash
Depending on the bash shipped with your system, it might be outdated. In order to update it, set a desired version of bash in `./init/20_osx_bash_update.sh` and then just run the script. It's not really necessary, but some useful features (like auto-completion in vim), won't work on bash versions older than 4.

#### OSX defaults
`./init/30_osx_defaults.sh` sets some nice default settings. It also sets Terminal/iTerm colors to [Solarized theme](http://ethanschoonover.com/solarized), printing full path in heading of Finder windows etc.


### Ubuntu
#### APT packages
Running `./init/10_ubuntu_apt.sh` will update APT and installs all packages listed in `init/apt-packages.txt`. Or you can always install the packages manually.


## Git
After all packages were installed, it's a good idea to configure git.

P.S. on Ubuntu you might want to install a more recent version of git via [PPA](https://launchpad.net/~git-core/+archive/ubuntu/ppa).

Add your credentials:
```
git config --global user.name "Your Name"
git config --global user.email "yourname@example.com"
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
* Install with [Miniconda](https://conda.io/miniconda.html) or [Anaconda](https://docs.continuum.io/anaconda/).
* Install using package managers. **On Ubuntu** using `apt-get` (see [this example](https://www.digitalocean.com/community/tutorials/how-to-install-python-3-and-set-up-a-local-programming-environment-on-ubuntu-16-04). The problem here is that usually it contains older version of Python, but you can try to install it with PPA (an [example](http://askubuntu.com/questions/865554/how-do-i-install-python-3-6-using-apt-get)). **On OSX** you can easily install it with MacPorts. You can run `./init/40_osx_python.sh` to install Python 2.7 and Python 3.6, it also sets `python36` as default `python` and installs pip and PyQt5. **P.S** to check which Python version pip is using run `pip -V`.
* **Ubuntu:** compile from source. Look [here](https://tecadmin.net/install-python-3-6-ubuntu-linuxmint/), [here](http://stackoverflow.com/questions/8097161/how-would-i-build-python-myself-from-source-code-on-ubuntu), and [here](https://docs.python.org/2/using/unix.html), good luck! **OSX:** install from official [Python's website](https://www.python.org/downloads/)

I decided to go wiht Miniconda installation for now, so `./init/40_python.sh` will fetch and install python allong wiht all pip packages (+ notebook extensions) from `pip-packages.txt`.

## Vim
On Ubuntu, you can always find the latest(-ish) version of vim either through package manager or form official repo.
In case you want to compile it manually, here's what you ought to do. Run either `./init/50_osx_vim.sh` or `./init/50_ubuntu_vim.sh` based on your system. **Don't forget to change Python's config dir to match your python**. More info on how to compile vim from source on OSX can be found [here](http://tartley.com/?p=1355), for Ubuntu check [here](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source) and [here](https://gist.github.com/odiumediae/3b22d09b62e9acb7788baf6fdbb77cf8).

On Ubuntu it's a good idea to use `sudo checkinstall` instead of `sudo make install`, then you can easily deinstall your vim with `dpkg -r [compiled-vim]` and don't forget to change package's name to something meaningfull when checkinstall asks you to.

**P.S.** when compiling vim with both python2 and python3, well [they don't play nicely](http://stackoverflow.com/a/23656675), so you'll probably have to choose either of them. Or [google it](http://unix.stackexchange.com/questions/305415/enabling-python3-on-vim-in-fedora-24).

Now that you have your Vim/MacVim successfully installed, we should install all of our precious plugins through `./init/51_vundle.sh`. What it does, it installs [Vundle](https://github.com/VundleVim/Vundle.vim) and all plugins listed in `~/.vimrc`. The script also installs [pre-patched fonts for Powerline](https://github.com/powerline/fonts) to work with [vim-airline](https://github.com/bling/vim-airline), you just have to specify the right font in your terminal/iTerm/MacVim etc. settings after installation.


## Extras

### Git status
I found this amazing python script called [show_status](http://blog.mikepearce.net/2010/06/16/git-status-on-multiple-repos/). It will show git status of all git repositories under current dir. The script `./init/60_git_show_status.sh` will download this script from its [github repo](https://github.com/MikePearce/Git-Status) and install it to `/usr/local/bin/`.

### The Fuck
Just type 
```
sudo apt update
sudo apt install python3-dev python3-pip
pip3 install --user thefuck
```
or on OSX
```
pip install thefuck
```

Put `eval $(thefuck --alias)` in your `~/.bashrc` or `~/.bash/aliases.bash` or wherever you store your aliases. You can read more on the [GitHub page](https://github.com/nvbn/thefuck).

### Terminal
#### OSX: iTerm and Terminal settings
`extras/` contains different colors for Terminal/iTerm2, and a config file for iTerm.

#### Ubuntu: Tilda's config
`extras/` folder contains `config_0`, a [Tilda's](https://github.com/lanoxx/tilda) configuration file which should be copied in `~/.tilda/`.

### Tmux
#### Bash completion
There is a bash completion script in `extras` folder, you just need to copy it somewhere sane and source from `bashrc`, which is already done in this dotfiles, assuming you did the following:

```
sudo mkdir /opt/completions
sudo cp {extras,/opt/completions}/tmux.completion.bash
```
#### Tmux plugin manager
[tpm](https://github.com/tmux-plugins/tpm) (Tmux Plugin Manager) installs and loads tmux plugins. To install it just run
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
The rest is in `home/.tmux.conf`. To install a new plugin put it in the `.tmux.conf`, source it and press `prefix` + <kbd>I</kbd>.

#### Italics
Italics are not necessarily supported out-of-the-box in all terminals. To fix that go [here](https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/), [here](https://www.reddit.com/r/vim/comments/24g8r8/italics_in_terminal_vim_and_tmux/), or [here](http://muddygoat.org/articles/italic-terminal-tmux) get enlightened and run

```
cd extras/
tic xterm-256color-italic.terminfo
tic tmux.terminfo
killall tmux
```

You should now enjoy italics in your tmux+vim+iterm combo, as the rest of the config is in the dotfiles.

### Menlo font
`extras` also contains a folder with Menlo font patched for Powerline, install as described [here](https://github.com/abertsch/Menlo-for-Powerline).

### Key Remap
I got used to Mac keyboard where `~` is located on the bottom row. So to remap it on Ubuntu > 16.04 I had to edit keys values in `/usr/share/X11/xkb/symbols/`. In order not to repeat this procedure again, just do the following:
```
sudo cp /usr/share/X11/xkb/symbols/us{,.backup}
sudo cp extras/keymap_us /usr/share/X11/xkb/symbols/us
```
I'm trying not to screw up here, that's why the first line is to create a backup. If something does go wrong just run `sudo cp /usr/share/X11/xkb/symbols/us{backup,}`.


## Dotfiles
Next, we need to symlink all files in `home` directory. I have a custom script, which always links files but ask user for backup. There are several scenarios:
- file already exist and is linked to a dotfile in your repository -> nothing happens.
- file exists and it is identical to your dotfiles -> file is replaced with symlink, no backup.
- file exist and differs from your dotfile -> file is symlinked to your dotfile, user is prompted to confirm backup.
- file doesn't exist -> symbolic link is created.

The script is mostly based on Simon Eskildsen's [linker.sh script](https://github.com/Sirupsen/dotfiles/blob/master/linker.sh), to which I added few modifications. Before linking files from you repository the scripts first checks dotfiles in your home `~/` directory for broken links and deletes them.

To link all dotfiles in your repository just type in:
```
./install.sh
```

## Warning
All this scripts worked fine for me, but might not work on your machine, so proceed with care. Never copy anything blindly, check what is inside and adjust to your workflow. Each script will exit as soon as any command in the scrip fails. If you want to see what is being executed, in the beginning of each script (around `line 8`) you should find the following:
```
set -e
```
change it to:
```
set -ex
```
Like that the script will output each command it's executing prepended with pluses.

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
- vim plugins
- find a good todo tool
- finish configuring Vimux for IPython
- parse pip requirements
- jedi-vim + venv
- vim-mode in bash + remap <M-.>
- show git needs push/pull in prompt, suspended jobs too
