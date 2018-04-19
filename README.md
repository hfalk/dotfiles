This repo is heavily inspired by [Morten Vaale Noddeland](https://github.com/mortenvn/dotfiles). Thanks :)

# Getting started
1. **Recommended:** Fork project to tweek the settings and make it your own
  or do it locally: `git clone https://github.com/hfalk/dotfiles`
2. Modify **settings.sh** to your needs
    * Change git name, and remove packages/applications you don't need
3. Update **macos.sh** with preferred tweaks
4. Run the install script: `bash install.sh`
(**Remember:** this project is using symlinks, so don't remove/delete projectfolder after install)
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
  * Install [Oh My Fish](https://github.com/oh-my-fish/oh-my-fish)
  * **[?]** Set fish as default shell
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
* **[?] Install Atom packages and config files**

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

# Things to remember
### Generate SSH key (use for github ++)
### Add GPG to Git/Github
1. Generate a new gpg [key](https://help.github.com/articles/generating-a-new-gpg-key/) (Remember same name and email as github)
  `gpg --gen-key`
2. List keys: `gpg --list-secret-keys --keyid-format LONG`
3. Export this key and add it to GitHub
  `gpg --armor --export <PASTE_LONG_KEY_HERE>`
4. Add key to git: `git config --global user.signingkey <PASTE_LONG_KEY_HERE>`
5. To set all commits for a repository to be signed by default: `git config --global commit.gpgsign true`
   * To set all commits in any local repository on your computer to be signed by default: `git config commit.gpgsign true`
6. Export to bash_profile, to avoid re-entering password
  `echo 'export GPG_TTY=$(tty)' >> ~/.bash_profile`


### Apps to install
Cisco AnyConnect Secure Mobility Client, Office365
