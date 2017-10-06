#!/bin/bash

# SCRIPT_DIR == Same folder as the script is placed in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/../settings.sh"
source "${SCRIPT_DIR}/utils.sh"

create_symlinks() {
  print_info "Create symlinks to the dotfiles"
  ${SCRIPT_DIR}/symlink_dotfiles.sh "../dotfiles/atom/" ~/.atom/ false
  printf "\n"
}

install_atom_packages(){
  printf "Here are some Atom packages that might be of use to you:\n"
  for package in $APM_PACKAGES; do
    printf "  * $package\n"
  done

  printf "\n" # An extra line break, purely for cosmetic reasons

  if ask_question "Do you want to install them?"; then
    apm install $APM_PACKAGES
    print_result $? "Install Atom packages"
  else
    print_error "Got it. No Atom packages for you."
  fi
}

print_heading "Fish"

create_symlinks
install_atom_packages
