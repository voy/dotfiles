ZSH=$HOME/.oh-my-zsh

export UPDATE_ZSH_DAYS=30

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew battery git-flow)

source $ZSH/oh-my-zsh.sh
source $HOME/.zshrc.gdc

# turn off all zsh autocorrections
unsetopt correct_all
unsetopt correct

# cd always behaves as pushd
setopt autopushd

# rvm
PATH=$PATH:$HOME/.rvm/gems/ruby-1.9.3-p392/bin:$HOME/.rvm/bin
# custom vim locations
PATH=$PATH:$HOME/bin/vim/bin:/opt/vim/bin
PATH=$PATH:$HOME/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin

function git_prompt {
    git_prompt_info | sed 's/git://'
}

local smiley="%(?,%{$fg[green]%}✓%{$reset_color%},%{$fg[red]%}✗%{$reset_color%})"
PROMPT='${smiley} %(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%c)/%{$reset_color%}» '
RPROMPT='%{$fg_bold[yellow]%}$(git_prompt)%{$reset_color%} $(battery_pct_prompt)'

function pubkeycp { pbcopy < $HOME/.ssh/id_rsa.pub }

# use as many cores as possible in rake
alias rake=drake
export RAKEOPT='-j'

export EDITOR=vim
export CLICOLOR=1

alias less='less -r'
alias df='df -h'
alias du='du -h'
alias ll='ls -alh'
alias l='ls -alh'
alias vim='vim -p'
alias vi='vim -p'
alias fname='find . -name'
alias finame='find . -iname'

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# speed up git autocompletion
__git_files () {
    _wanted files expl 'local files' _files   
}

bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

function last-commit-message {
    git log --format=%s -n 1
}

function pull-request {
    hub pull-request "$(last-commit-message)" $@
}

# set ruby version using rvm (if installed)
RVM=$HOME/.rvm/scripts/rvm
if [[ -f $RVM ]]; then
    . $RVM
    rvm use 1.9.3 &> /dev/null
fi

# ctrl-z lets you enter another command and then finish typing the first command
fancy-ctrl-z () {
    if [[ $#BUFFER -eq 0 ]]; then
        bg
        zle redisplay
    else
        zle push-input
    fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# ctrl-X-e edits command in $EDITOR
autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line
