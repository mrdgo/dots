#!/usr/bin/env zsh
set -e
if ! [ -x "$(command -v ansible)" ]; then
  paru -S ansible
fi

ansible-playbook -i ~/.dotfiles/hosts ~/.dotfiles/dotfiles.yml --ask-become-pass

if command -v terminal-notifier 1>/dev/null 2>&1; then
  terminal-notifier -title "dotfiles: Bootstrap complete" -message "Successfully set up dev environment."
fi
