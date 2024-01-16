#!/usr/bin/env bash
# find . -type l >> .gitignore

# Ask Y/n
function ask() {
    read -r -p "$1 (Y/n): " resp
    if [ -z "$resp" ]; then
        response_lc="y" # empty is Yes
    else
        response_lc=$(echo "$resp" | tr '[:upper:]' '[:lower:]') # case insensitive
    fi

    [ "$response_lc" = "y" ]
}

function check_link() {
  [ -L "$1" ] || [ -d "$1" ]
}

function is_installed() {
  [ -x "$(command -v "$1")" ]
}

# DEBUG HELPERS
function error() {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] %s\n" "$1"
}

function success() {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] %s\n" "$1"
}

function info() {
  printf "\r  [ \033[00;34m..\033[0m ] %s\n" "$1"
}

function warning() {
  printf "\r  [\033[0;33mWARN\033[0m] %s\n" "$1"
}

path=$(eval echo ~/.config/nvim)
if ask "Do you want to install neovim config (--> $path)?"; then
  if is_installed nvim; then
    success "nvim is installed."
  else
    warning "nvim is not installed."
  fi

  if check_link "$path"; then
    warning "$path already exists."
  else
	  if ln -s "$(realpath "nvim")" "$path"; then
      success "installed nvim config."
    else
      error "could not link."
    fi
  fi
fi

path=$(eval echo ~/.config/mc)
local_path=$(eval echo ~/.local/share/mc)
if ask "Do you want to install midnight commander config (--> $path)?"; then
  if is_installed mc; then
    success "mc is installed."
  else
    warning "mc is not installed."
  fi

  if check_link "$path"; then
    warning "$path already exists."
  else
    if ln -s "$(realpath "mc")" "$path"; then
      success "instaled mc config."
    else
      error "could not link."
    fi
  fi

  if check_link "$local_path"; then
    warning "$local_path already exists."
  else
    if ln -s "$(realpath "mc-local")" "$local_path"; then
      success "installed mc local share config"
    else
      error "could not link."
    fi
  fi
fi

path=$(eval echo ~/.config/tmux)
if ask "Do you want to install tmux config? (--> $path)"; then
  if is_installed tmux; then
    success "tmux is installed"
  else
    warning "tmux is not installed"
  fi

  if check_link "$path"; then
    warning "$path already exists."
  else
    if ln -s "$(realpath "tmux")" "$path"; then
      success "installed tmux config."
    else
      error "could not link."
    fi
  fi
fi

