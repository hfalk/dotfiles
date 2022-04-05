#!/bin/bash

# SCRIPT_DIR == Same folder as the script is placed in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/../settings.sh"
source "${SCRIPT_DIR}/utils.sh"

create_symlinks() {
  print_info "Creating symlinks to the bash dotfiles"
  ${SCRIPT_DIR}/symlink_dotfiles.sh "../dotfiles/bash/"
}

install_bash_packages() {
  print_info "Installing brew packages needed by bash:"
  print_list $@
  brew install "$@"
  print_result $? "Install bash packages\n"
}

add_bash_as_allowed_shell() {
  print_info "Adding Bash 4 to list of allowed shells"
  # Add bash to /etc/shells (the list of allowed shells)
  # If "/usr/local/bin/fish" isn't already in "/etc/shells", add it to the list"
  grep -q -F '/usr/local/bin/bash' '/etc/shells' || echo '/usr/local/bin/bash' | sudo tee -a '/etc/shells'
  print_result $? "Add Bash 4 to allowed shells"
}


print_heading "Bash"
printf "If you want, we can make Bash a bit better as well. Zsh will still be the default shell, so this will only be useful if you sometimes want to use bash instead of zsh\n\n"

if ask_question "Add Bash support?"; then
  create_symlinks
  printf "\n"
  install_bash_packages $BASH_BREW_PACKAGES
  add_bash_as_allowed_shell
else
  print_error "Good riddance!"
fi
