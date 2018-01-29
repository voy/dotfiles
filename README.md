# Dotfiles

Welcome to my dotfiles repo. Feel free to take a look around.

## Instructions

### Symlinks

Run `install.sh` to symlink files specified in `$FILES` to their respective
counterparts in `$HOME`.

This requires `coreutils` to be installed via `brew`.

### Editor plugins

For vim plugins I use Vundle (run `:PluginInstall`), for Atom I have not
found an equivalent tool, so you need to periodically snapshot installed
packages using `update-atom-packages.sh` and install them manually using
`install-atom-packages.sh`.

### fzf

Install `fzf-zsh` from [GitHub](https://github.com/Wyntau/fzf-zsh).