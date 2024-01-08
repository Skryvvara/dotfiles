#!/usr/bin/env bash
# find . -type l >> .gitignore

# Ask Y/n
function ask() {
    read -p "$1 (Y/n): " resp
    if [ -z "$resp" ]; then
        response_lc="y" # empty is Yes
    else
        response_lc=$(echo "$resp" | tr '[:upper:]' '[:lower:]') # case insensitive
    fi

    [ "$response_lc" = "y" ]
}

function check_link() {
  [ -L "$1" ]
}

function is_installed() {
  [ -x "$(command -v $1)" ]
}

# DEBUG HELPERS
function error() {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
}

function success() {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

function info() {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

function user() {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

path=$(eval echo ~/.config/nvim)
if ask "Do you want to install neovim config ($path)?"; then
  if is_installed nvim; then
    success "nvim is installed"
  else
    brew install neovim
  fi

  if check_link "$path"; then
    error "Error: $path already exists."
  else
	  ln -s "$(realpath "nvim")" $path
    success "installed nvim config."
  fi
fi

