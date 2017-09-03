#!/bin/bash

# SCRIPT_DIR == Same folder as the script is placed in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}/../settings.sh"
source "${SCRIPT_DIR}/utils.sh"

print_heading "Atom"

# Atom editor settings
printf "Copying Atom settings.."
mv -f ~/.atom ~/dotfiles_old/
ln -s ${SCRIPT_DIR}/dotfiles/atom ~/.atom
printf "Done"

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
