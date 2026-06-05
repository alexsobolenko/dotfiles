# Config DOTFILES

## INSTALLATION

Run:

```bash
./install.sh
```

The script checks required commands, installs Oh My Zsh dependencies and creates
symlinks for Git, Zsh, Micro, WezTerm and VS Code. Existing application config paths
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

## GIT

1. Install `git`
2. ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig
3. Create `~/.gitconfig.local` with local user settings:

```ini
[user]
    name = Your Name
    email = your.email@example.com
```

## ZSH

1. Install `zsh`
2. Install `oh-my-zsh`
3. ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
4. Install Oh My Zsh custom plugins from `zsh/omz-plugins.txt`
5. ln -s ~/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh
6. cp ~/dotfiles/zsh/.zsh_history.template ~/.zsh_history
7. ln -s ~/dotfiles/zsh/.zsh_aliases ~/.zsh_aliases

## BASH

1. ln -s ~/dotfiles/bash/.bashrc ~/.bashrc
2. cp ~/dotfiles/bash/.bash_history.template ~/.bash_history
3. ln -s ~/dotfiles/bash/.bash_aliases ~/.bash_aliases
4. ln -s ~/dotfiles/bash/.profile ~/.profile

## MICRO

1. Install `micro`
2. ln -s ~/dotfiles/micro ~/.config/micro

## MIDNIGHT COMMANDER

1. Install `mc`
2. ln -s ~/dotfiles/mc/config ~/.config/mc
3. ln -s ~/dotfiles/mc/.selected_editor ~/.selected_editor

## VISUAL STUDIO CODE

1. Install Visual Studio Code
2. ln -s ~/dotfiles/vscode ~/.config/Code/User
3. Install extensions from file `vscode/extensions.txt`

## WEZTERM

1. Install `wezterm`
2. ln -s ~/dotfiles/wezterm ~/.config/wezterm
