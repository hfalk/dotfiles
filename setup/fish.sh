#!/bin/bash

# SCRIPT_DIR == Same folder as the script is placed in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/../settings.sh"
source "${SCRIPT_DIR}/utils.sh"

create_symlinks() {
  print_info "Creating symlinks to the dotfiles"
  ${SCRIPT_DIR}/symlink_dotfiles.sh "../dotfiles/fish/config/" ~/.config/fish/ false
  ${SCRIPT_DIR}/symlink_dotfiles.sh "../dotfiles/fish/functions/" ~/.config/fish/functions/ false
  ${SCRIPT_DIR}/symlink_dotfiles.sh "../dotfiles/universal/"
  printf "\n"
}

add_fish_as_allowed_shell() {
  # Add fish to /etc/shells (the list of allowed shells)
  # If "/usr/local/bin/fish" isn't already in "/etc/shells", add it to the list"
  grep -q -F '/usr/local/bin/fish' '/etc/shells' || echo '/usr/local/bin/fish' | sudo tee -a '/etc/shells'
}

install_fisherman() {
  print_info "Installing fisherman (package manager)"
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
  print_result $? "Install fisherman\n"
}

install_fisherman_packages() {
  print_info "Installing fisherman packages:"
  print_list $FISHERMAN_PACKAGES
  /usr/local/bin/fish -c "fisher install $FISHERMAN_PACKAGES"
  print_result $? "Install fisherman packages\n"
}

install_oh_my_fish() {
  if ask_question "Do you want to install Oh My Fish?"; then
    rm ~/.config/fish/functions/fish_prompt.fish
    if test -d $HOME/.local/share/omf; then
      print_error "Oh! Seems like Oh My Fish were already installed ¯\_(ツ)_/¯\n"
    else
      curl -L https://get.oh-my.fish | fish
      /usr/local/bin/fish -c "omf install https://github.com/hfalk/theme-falk"
      /usr/local/bin/fish -c "omf theme falk"
      print_result $? "Install Oh My Fish\n"
    fi
  else
    print_error "Alright, your loss!"
  fi
}

install_re_search() {
  print_info "Installing re-search (backwards search using CTRL+R or arrow keys)"

  make -C ~/.config/fisherman/re-search
  chmod +x ~/.config/fisherman/re-search/re-search
  ln -sb ~/.config/fisherman/re-search/re-search /usr/local/bin/re-search

  print_result $? "Install re-search\n"
}

set_fish_as_default_shell() {
  if ask_question "Do you want to set Fish as your default shell?"; then
    # Set fish as default shell
    chsh -s /usr/local/bin/fish
    print_result $? "Set Fish as default shell\n"
  else
    print_error "Alright. When the installer is finished, you can type 'fish' in the terminal to test it without setting it as your default"
  fi
}


print_heading "Fish"

create_symlinks
add_fish_as_allowed_shell
install_fisherman
install_fisherman_packages
install_oh_my_fish
install_re_search
set_fish_as_default_shell
