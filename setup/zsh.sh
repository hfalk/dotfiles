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

install_fzf() {
  if ask_question "Do you want to install fzf?"; then
    brew install fzf
    $(brew --prefix)/opt/fzf/install
  else
    print_error "Alright, your loss!"
  fi
}

print_heading "Zsh"
install_bash_packages $ZSH_BREW_PACKAGES
create_symlinks
install_oh_my_zsh
install_fzf
