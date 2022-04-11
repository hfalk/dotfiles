#!/bin/bash

# SCRIPT_DIR == Same folder as the script is placed in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/../settings.sh"
source "${SCRIPT_DIR}/utils.sh"

install_zsh_packages() {
  print_info "Installing brew packages needed by zsh:"
  print_list $@
  brew install "$@"
  print_result $? "Install zsh packages\n"
}

create_symlinks() {
  print_info "Creating symlinks to the zsh dotfiles"
  ${SCRIPT_DIR}/symlink_dotfiles.sh "../dotfiles/zsh/"
  ${SCRIPT_DIR}/symlink_dotfiles.sh "../dotfiles/universal/"
  printf "\n"
}

add_zsh_as_allowed_shell() {
  # Add zsh to /etc/shells (the list of allowed shells)
  # If "/usr/local/bin/zsh" isn't already in "/etc/shells", add it to the list"
  grep -q -f $(which zsh) /etc/shells || echo $(which zsh) | sudo tee -a /etc/shells
}

install_oh_my_zsh() {
  if ask_question "Do you want to install Oh My Zsh?"; then
    if test -d $HOME/.oh-my-zsh; then
      print_error "Oh! Seems like Oh My Zsh were already installed ¯\_(ツ)_/¯\n"
    else
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

      print_result $? "Install Oh My Zsh\n"
    fi
  else
    print_error "Alright, your loss!"
  fi
}

set_zsh_as_default_shell() {
  if ask_question "Do you want to set Zsh as your default shell?"; then
    # Set zsh as default shell
    chsh -s $(which zsh)
    print_result $? "Set Zsh as default shell\n"
  else
    print_error "Alright. When the installer is finished, you can type 'zsh' in the terminal to test it without setting it as your default"
  fi
}

print_heading "Zsh"
install_bash_packages $ZSH_BREW_PACKAGES
create_symlinks
add_zsh_as_allowed_shell
install_oh_my_zsh
set_zsh_as_default_shell
