#!/usr/bin/env bash

set -euo pipefail

dotfiles_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
config_home="${XDG_CONFIG_HOME:-"$HOME/.config"}"
vscode_user_dir="${VSCODE_USER_DIR:-"$config_home/Code/User"}"
omz_dir="${OMZ:-"$HOME/.oh-my-zsh"}"
omz_custom_dir="$omz_dir/custom"

dry_run=0

usage() {
  cat <<'USAGE'
Usage: ./install.sh [options]

Install personal dotfiles, Oh My Zsh dependencies and VS Code extensions.

Options:
  -n, --dry-run   Show what would be changed without touching files
  -h, --help      Show this help

Environment:
  XDG_CONFIG_HOME    Base config directory (default: ~/.config)
  VSCODE_USER_DIR    VS Code User directory (default: ~/.config/Code/User)
  OMZ                Oh My Zsh directory (default: ~/.oh-my-zsh)
USAGE
}

while (($#)); do
  case "$1" in
    -n|--dry-run)
      dry_run=1
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
  shift
done

log() {
  printf '%s\n' "$*"
}

run() {
  if ((dry_run)); then
    printf 'dry-run:'
    printf ' %q' "$@"
    printf '\n'
  else
    "$@"
  fi
}

require_commands() {
  local missing=0

  for command in code curl git micro wezterm zsh; do
    if ! command -v "$command" >/dev/null 2>&1; then
      echo "Missing required command: $command" >&2
      missing=1
    fi
  done

  if [[ ! -s "$HOME/.nvm/nvm.sh" ]]; then
    echo "Missing required file: $HOME/.nvm/nvm.sh" >&2
    missing=1
  fi

  if ((missing)); then
    exit 1
  fi
}

install_oh_my_zsh() {
  if [[ -d "$omz_dir" ]]; then
    log "ok: $omz_dir already exists"
    return 0
  fi

  log "install: Oh My Zsh -> $omz_dir"

  if ((dry_run)); then
    printf 'dry-run:'
    printf ' %q' \
      env \
      "ZSH=$omz_dir" \
      RUNZSH=no \
      CHSH=no \
      KEEP_ZSHRC=yes \
      sh \
      -c \
      '$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)' \
      "" \
      --unattended
    printf '\n'
  else
    env \
      ZSH="$omz_dir" \
      RUNZSH=no \
      CHSH=no \
      KEEP_ZSHRC=yes \
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  fi
}

install_omz_plugins() {
  local plugins_file="$dotfiles_dir/zsh/omz-plugins.txt"

  if [[ ! -f "$plugins_file" ]]; then
    return 0
  fi

  run mkdir -p "$omz_custom_dir"

  while read -r target repo _; do
    if [[ -z "${target:-}" || "$target" == \#* ]]; then
      continue
    fi

    local plugin_dir="$omz_custom_dir/$target"
    if [[ -d "$plugin_dir" ]]; then
      log "ok: $plugin_dir already exists"
      continue
    fi

    log "clone: $repo -> $plugin_dir"
    run mkdir -p "$(dirname "$plugin_dir")"
    run git clone --depth=1 "$repo" "$plugin_dir"
  done < "$plugins_file"
}

link_path() {
  local source="$1"
  local target="$2"

  if [[ ! -e "$source" ]]; then
    echo "Missing source: $source" >&2
    exit 1
  fi

  run mkdir -p "$(dirname "$target")"

  if [[ -L "$target" && "$(readlink "$target")" == "$source" ]]; then
    log "ok: $target -> $source"
    return 0
  fi

  if [[ -e "$target" || -L "$target" ]]; then
    log "remove: $target"
    run rm -rf "$target"
  fi

  log "link: $target -> $source"
  run ln -s "$source" "$target"
}

install_links() {
  link_path "$dotfiles_dir/git/.gitconfig" "$HOME/.gitconfig"
  link_path "$dotfiles_dir/zsh/.zshrc" "$HOME/.zshrc"
  link_path "$dotfiles_dir/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
  link_path "$dotfiles_dir/micro" "$config_home/micro"
  link_path "$dotfiles_dir/wezterm" "$config_home/wezterm"
  link_path "$dotfiles_dir/vscode" "$vscode_user_dir"
}

install_git_local_config() {
  local target="$HOME/.gitconfig.local"

  if [[ -f "$target" ]]; then
    log "ok: $target already exists"
    return 0
  fi

  if ((dry_run)); then
    log "dry-run: would ask for Git user.name, user.email"
    log "dry-run: would create $target"
    return 0
  fi

  local git_user_name
  local git_user_email

  read -r -p "Git user.name: " git_user_name
  read -r -p "Git user.email: " git_user_email

  {
    printf '[user]\n'
    printf '    name = %s\n' "$git_user_name"
    printf '    email = %s\n' "$git_user_email"
  } > "$target"

  chmod 600 "$target"
  log "created: $target"
}

install_zsh_history_template() {
  local source="$dotfiles_dir/zsh/.zsh_history.template"
  local target="$HOME/.zsh_history"

  if [[ ! -f "$source" ]]; then
    return 0
  fi

  if [[ -e "$target" ]]; then
    log "skip: $target already exists"
    return 0
  fi

  log "copy: $source -> $target"
  run cp "$source" "$target"
}

install_vscode_extensions() {
  local extensions_file="$dotfiles_dir/vscode/extensions.txt"

  if [[ ! -f "$extensions_file" ]]; then
    return 0
  fi

  log "install: VS Code extensions from $extensions_file"

  while read -r extension _; do
    extension="${extension%%#*}"
    extension="${extension//[[:space:]]/}"

    if [[ -z "$extension" ]]; then
      continue
    fi

    run code --install-extension "$extension" --force
  done < "$extensions_file"
}

require_commands
install_git_local_config
install_oh_my_zsh
install_omz_plugins
install_links
install_zsh_history_template
install_vscode_extensions

log "Done."
