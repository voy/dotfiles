ZSH=$HOME/.oh-my-zsh

export UPDATE_ZSH_DAYS=90

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Must be set before zsh-nvm is loaded
export NVM_LAZY_LOAD=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git brew battery fzf-zsh zsh-nvm)

source $ZSH/oh-my-zsh.sh
source $HOME/dotfiles/z.sh

# turn off all zsh autocorrections
unsetopt correct_all
unsetopt correct

# don't show env variable names in directory prompt
unsetopt auto_name_dirs

# cd always behaves as pushd
setopt autopushd

# run git from homebrew, not the system one
PATH=/usr/local/bin:$PATH
# custom vim locations
PATH=$PATH:$HOME/bin/vim/bin:/opt/vim/bin
PATH=$PATH:$HOME/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
PATH=$PATH:/opt/apache-maven-3.3.9/bin

git_prompt() {
    git_prompt_info | sed 's/git://'
}

local smiley="%(?,%{$fg[green]%}:)%{$reset_color%},%{$fg[red]%}:(%{$reset_color%})"
PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%c)%{$reset_color%} ${smiley} '
RPROMPT='%{$fg_bold[yellow]%}$(git_prompt)%{$reset_color%} $(battery_pct_prompt)'

export EDITOR=vim
export CLICOLOR=1

alias less='less -r'
alias df='df -h'
alias du='du -h'
alias ll='ls -alh'
alias l='ls -alh'
alias vim='vim -p'
alias vi='vim -p'

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

lock() {
    open -a /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app
}

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

generate-daily-log-template() {
    echo "# Weekly log"
    echo

    local monday=$1

    for i in `seq 0 4`; do
      gdate -d"$monday+$i days" "+## %A %d.%m.%Y"
      echo
    done
}

daily-log() {
    local monday=$(gdate -d"this-monday" "+%Y-%m-%d")
    local markdown_path="$HOME/Documents/notes/$monday.md"

    if [[ ! -f $markdown_path ]]; then
        generate-daily-log-template $monday > $markdown_path
    fi

    macdown "$markdown_path"
}

source $HOME/.zshrc.aws

