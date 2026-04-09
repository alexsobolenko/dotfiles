# Config DOTFILES

## WEZTERM

-

## NEOVIM

### Installation

1. Install `neovim` (ver >= 0.10)
2. Install `composer`
3. Install `nodejs`
4. Install following npm packages globally:
    - `@volar/server`
    - `@vue/language-server`
    - `dockerfile-language-server-nodejs`
    - `intelephense`
    - `tree-sitter-cli`
    - `twiggy-language-server`
    - `typescript-language-server`
    - `typescript`
    - `vls`
    - `vscode-langservers-extracted`
    - `yaml-language-server`
5. Install `lazygit` to use `lazygit` plugin
6. Install `ripgrep` to use `telescope` plugin
7. Install `xclip` (or another clipboard utility) to use OS clipboard

### Configuration

* __Theme__ - create file `~/.config/nvim/.theme` with theme name. Use filenames from dir `lua/plugins/theme` (default - `monokai`)

### TODO

1. Generate phpdocs
2. Php annotations
3. Ruby?
4. Python?
5. Golang?
