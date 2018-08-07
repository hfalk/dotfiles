# GIT
GIT_NAME="Håvard Falk"
GIT_EMAIL="hfalk4@gmail.com"

# APPLICATIONS
# The applications below are regular apps such as Chrome and Spotify.
# Please make sure that you remove all the programs you don't want to install on your computer
# P.S. The installer script won't install the applications unless you tell it to. It's your call  :)
BREW_CASKS="alfred android-studio appcleaner atom google-backup-and-sync basictex
  calibre flux google-chrome intellij-idea iterm2 java jetbrains-toolbox postman
  pycharm r-app skype skype-for-business slack spectacle spotify torbrowser
  transmission veracrypt vlc"

# NODE
NPM_PACKAGES="n ncu"

# ATOM
APM_PACKAGES="atom-beautify autoclose-html autocomplete-paths busy-signal color-picker
  editorconfig elm-format elmjutsu expose file-icons git-blame git-time-machine
  highlight-selected intentions language-babel language-elm language-r linter
  linter-elm-make linter-eslint linter-flake8 linter-ui-default minimap open-recent
  pigments seti-syntax seti-ui todo-show"

# BREW (OPTIONAL)
OPTIONAL_BREW_PACKAGES="bazel gnupg nmap nvm pyenv wget yarn"

# --------------------------------------------------------------
# DANGER ZONE! EDIT THE FOLLOWING SETTINGS WITH CARE
# Removing some of them might break the setup :/
# --------------------------------------------------------------

# BREW (ESSENTIAL)
ESSENTIAL_BREW_PACKAGES="coreutils diff-so-fancy fish git grep mongodb node
  postgresql python python@2 openssh screen vim"

# FISH (installed with fisherman)
FISHERMAN_PACKAGES="z jbonjean/re-search"

# BASH (installed with brew)
BASH_BREW_PACKAGES="bash bash-completion z"

# PYTHON
PIP_PACKAGES="autopep8 flake8 pygments virtualenv virtualfish"
