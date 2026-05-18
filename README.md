# Config DOTFILES

## INSTALLATION

Run:

```bash
./install.sh
```

The script checks required commands, installs Oh My Zsh dependencies and creates
symlinks for Git, Zsh, Neovim, WezTerm and VS Code. Existing application config paths
are removed and replaced with symlinks. VS Code extensions are installed from
`vscode/extensions.txt`.

VS Code extensions are installed with `--force`. VS Code may still ask to trust
an extension publisher on first use.

Useful options:

```bash
./install.sh --dry-run
```

Oh My Zsh custom plugins and themes are installed from `zsh/omz-plugins.txt`.
Set `OMZ` to use a custom Oh My Zsh directory.

Git user name, email and safe directory are stored in `~/.gitconfig.local`.
The install script creates it interactively if it does not exist.

To refresh the saved VS Code extensions list:

```bash
./sync-vscode-extensions.sh
```

If `~/.zsh_history` does not exist, the install script copies
`zsh/.zsh_history.template` to seed useful commands. The real shell history is
not tracked.

Zsh config aliases `ls` to `colorls`. `colorls` requires Ruby/gem installation;
an alternative without Ruby has not been selected yet.

## VISUAL STUDIO CODE

1. ln -s ~/dotfiles/vscode ~/.config/Code/User

## WEZTERM

1. ln -s ~/dotfiles/wezterm ~/.config/wezterm

## NEOVIM

### Installation

1. ln -s ~/dotfiles/nvim ~/.config/nvim
2. Install `neovim` (ver >= 0.10)
3. Install `composer`
4. Install `nodejs`
5. Install following npm packages globally:
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
6. Install `ripgrep` to use `telescope` plugin
7. Install `xclip` (or another clipboard utility) to use OS clipboard

### Configuration

* __Theme__ - create file `~/.config/nvim/.theme` with theme name. Use filenames from dir `lua/plugins/theme` (default - `monokai`)
