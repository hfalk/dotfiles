#!/bin/bash

# SCRIPT_DIR == Same folder as the script is placed in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/../settings.sh"
source "${SCRIPT_DIR}/utils.sh"

install_xcode_select() {
  print_info "Installing Xcode Command Line Tools (This might take a few minutes)"

  if type xcode-select >&- && xpath=$( xcode-select --print-path ) && test -d "${xpath}" && test -x "${xpath}" ; then
    print_success "Oh! Seems like the Xcode tools were already installed ¯\_(ツ)_/¯\n"
  else
    touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
    PROD=$(softwareupdate -l |
      grep "\*.*Command Line" |
      head -n 1 | awk -F"*" '{print $2}' |
      sed -e 's/^ *//' |
      tr -d '\n')
    softwareupdate -i "$PROD" --verbose;

    print_result $? "Install Xcode Command Line Tools\n";
  fi
}

install_brew() {
  print_info "Checking if Homebrew is installed"
  if ! which brew > /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/havard/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    print_info "Running brew doctor"
    brew doctor
    print_result $? "Not installed. Install Homebrew\n"
  else
    print_success "Oh! Homebrew was already installed!\n"
  fi
}

install_brew_packages() {
  print_info "Installing essential homebrew packages:"
  print_list $@
  brew update
  brew upgrade -all
  brew install "$@"
  print_result $? "Install brew packages\n"
}

print_heading "Install prerequisites"
install_xcode_select
install_brew
install_brew_packages $BREW_PACKAGES
