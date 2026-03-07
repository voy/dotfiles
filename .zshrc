# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

ZSH=$HOME/.oh-my-zsh

export UPDATE_ZSH_DAYS=90

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git brew fzf nvm z)

source $ZSH/oh-my-zsh.sh

# turn off all zsh autocorrections
unsetopt correct_all
unsetopt correct

# don't show env variable names in directory prompt
unsetopt auto_name_dirs

# cd always behaves as pushd
setopt autopushd

# run git from homebrew, not the system one
PATH=/usr/local/bin:$HOME/Library/Python/3.9/bin:$PATH
# custom vim locations
PATH=$PATH:$HOME/bin/vim/bin:/opt/vim/bin
PATH=$PATH:$HOME/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
PATH=$PATH:/opt/apache-maven-3.3.9/bin
PATH=$PATH:/opt/homebrew/opt/python@3.13/libexec/bin
PATH=$PATH:$HOME/.local/bin
PATH=/opt/homebrew/opt/openjdk/bin:$PATH

export EDITOR=vim
export CLICOLOR=1

alias less='less -r'
alias df='df -h'
alias du='du -h'
alias ll='ls -alh'
alias l='ls -alh'
alias vim='vim -p'
alias vi='vim -p'
alias stree='/Applications/SourceTree.app/Contents/Resources/stree'

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# speed up git autocompletion
__git_files () {
    _wanted files expl 'local files' _files
}

bindkey "^U" backward-kill-line
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# allow ctrl-a and ctrl-d to select all and deselect all
export FZF_DEFAULT_OPTS="--bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all"

zstyle ':completion:*' matcher-list '' \
    'm:{a-z\-}={A-Z\_}' \
    'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
    'r:[[:ascii:]]||[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}'

source ~/.zshrc.miro

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

function wip() {
  if git rev-parse --verify wip >/dev/null 2>&1; then
    git add -A && git commit --amend --no-edit --no-verify
  else
    git add -A && git commit --no-verify -m "wip"
  fi
}

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

[[ -s "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"

export NVM_HOMEBREW=$(brew --prefix nvm)
export NVM_LAZY=1
export NVM_LAZY_CMD="npx yarn"

alias awsp="source _awsp"

autoload -U promptinit; promptinit

zstyle :prompt:pure:path color 39
zstyle :prompt:pure:prompt:success color 76
zstyle :prompt:pure:prompt:error color red
zstyle :prompt:pure:git:dirty color yellow
zstyle :prompt:pure:git:branch color 76

prompt pure

update_git_branch_var() {
    export gb=$(git branch --show-current 2>/dev/null | cut -d'-' -f1,2)
}

update_full_git_branch_var() {
    export gbf=$(git branch --show-current 2>/dev/null)
}

add-zsh-hook preexec update_git_branch_var
add-zsh-hook preexec update_full_git_branch_var
