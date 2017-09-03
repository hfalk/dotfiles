This repo is heavily inspired by [Morten Vaale Noddeland](https://github.com/mortenvn/new-dotfiles)

# Getting started
1. `git clone https://github.com/hfalk/dotfiles`
or `curl https://github.com/hfalk/dotfiles/tarball/master`
2. Modify **siettings.sh** to your needs
    * Change git name, and remove packages/applications you don't need
3. Run the install script: `./install.sh`

# What does the install script do?
Lots of things! The following things will happen in cronological order:

<sub>**[?]** = **Optional** (the installer will ask before making the change)</sub>

* **Prerequisites**
  * Install [Xcode Select](http://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/)
  * Install [Homebrew](https://brew.sh/)
  * Install essential brew packages (e.g. `fish`, `node`, `python` and `coreutils`)
* **Fish**
  * Symlink [universal dotfiles](https://github.com/mortenvn/dotfiles/tree/master/dotfiles/universal) (such as  [.gitconfig](https://github.com/mortenvn/dotfiles/blob/master/dotfiles/universal/gitconfig) and [.vimrc](https://github.com/mortenvn/dotfiles/blob/master/dotfiles/universal/vimrc))
  * Symlink [fish specific dotfiles](https://github.com/mortenvn/dotfiles/tree/master/dotfiles/fish)
  * Install [Fisherman](https://fisherman.github.io/) (fish package manager)
  * Install Fisherman packages (e.g. [pure theme](https://github.com/rafaelrinaldi/pure) and [z](https://github.com/rupa/z))
  * Install Oh My Fish
  * **[?]** Set fish as default theme
* **[?] Bash**
  * Symlink [bash specific dotfiles](https://github.com/mortenvn/dotfiles/tree/master/dotfiles/bash)
  * Install bash specific brew dependencies
* **Vim**
  * Install vim-plug (vim package manager)
  * Install vim plugins (see [.vimrc](https://github.com/mortenvn/dotfiles/blob/master/dotfiles/universal/vimrc))
* **Git**
  * Set git name and email
* **[?] Install global NPM packages**
* **[?] Change macOS default (about 100 tweaks in total)**
* **[?] Install applications (such as Chrome and Spotify)**

For more information of what the **actual dotfiles** does, take a look at [source code](https://github.com/hfalk/dotfiles/tree/master/dotfiles).


# Better terminal colors
![Snazzy theme by Sindre Sorhus](https://github.com/sindresorhus/terminal-snazzy/raw/master/screenshot.png)


### Terminal
1. Open the file `other/snazzy.terminal`
2. Open **Preferences** ➔ **Profiles**
3. Select **Snazzy** and click **Default**


### iTerm
1. Open the file `other/snazzy.itermcolors`
2. Select **Snazzy** from **Preferences** ➔ **Profiles** ➔ **Colors** ➔ **Load Presets**
