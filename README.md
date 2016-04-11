# Dotfiles

Welcome to my dotfiles repo. Feel free to browse!

## Instructions

### Symlink dotfiles

Run `install.sh` to symlink files specified in `$FILES` to their respective
counterparts in `$HOME`. This requires `coreutils` to be install via `brew`.

### Editor plugins

For vim plugins I use Vundle (run `:PluginInstall`), for Atom I have not
found an equivalent tool, so you need to periodically snapshot installed
packages using `update-atom-packages.sh` and install them manually using
`install-atom-packages.sh`.

### ZSHmarks

    cd ~/.oh-my-zsh/custom/plugins
    git clone https://github.com/jocelynmallon/zshmarks.git