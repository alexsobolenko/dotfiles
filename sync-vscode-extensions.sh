#!/usr/bin/env bash

set -euo pipefail

dotfiles_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
extensions_file="$dotfiles_dir/vscode/extensions.txt"

usage() {
  cat <<'USAGE'
Usage: ./sync-vscode-extensions.sh

Export the currently installed VS Code extensions to vscode/extensions.txt.
USAGE
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

if (($#)); then
  echo "Unknown option: $1" >&2
  usage >&2
  exit 2
fi

if ! command -v code >/dev/null 2>&1; then
  echo "VS Code CLI 'code' is not available." >&2
  exit 1
fi

mkdir -p "$(dirname "$extensions_file")"
code --list-extensions | sort > "$extensions_file"

echo "Updated $extensions_file"
