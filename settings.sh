# GIT
GIT_NAME="Håvard Falk"
GIT_EMAIL="hfalk4@gmail.com"

# APPLICATIONS
# The applications below are regular apps such as Chrome and Spotify.
# Please make sure that you remove all the programs you don't want to install on your computer
# P.S. The installer script won't install the applications unless you tell it to. It's your call  :)
BREW_CASKS="android-studio appcleaner calibre colima docker docker-compose figma fzf
google-chrome iterm2 kap postman spectacle spotify torbrowser veracrypt visual-studio-code"

"$(brew --prefix)/opt/fzf/install"

# NODE
NPM_PACKAGES="n ncu"

# BREW (OPTIONAL)
OPTIONAL_BREW_PACKAGES="gnupg nvm wget"

# --------------------------------------------------------------
# DANGER ZONE! EDIT THE FOLLOWING SETTINGS WITH CARE
# Removing some of them might break the setup :/
# --------------------------------------------------------------

# BREW (ESSENTIAL)
ESSENTIAL_BREW_PACKAGES="coreutils diff-so-fancy git grep mongodb node postgresql python python@2 openssh screen vim"

# ZSH (installed with brew)
ZSH_BREW_PACKAGES="zsh zsh-autosuggestions zsh-syntax-highlighting"
