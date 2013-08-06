ZSH=$HOME/.oh-my-zsh

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew battery)

source $ZSH/oh-my-zsh.sh
source $HOME/.zshrc.gdc

# turn off all zsh autocorrections
unsetopt correct_all
unsetopt correct

# rvm
PATH=$PATH:$HOME/.rvm/gems/ruby-1.9.3-p392/bin:$HOME/.rvm/bin
# custom vim installations
PATH=$PATH:$HOME/bin/vim/bin:/opt/vim/bin
PATH=$PATH:$HOME/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin

function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

local checkmark="%(?,%{$fg[green]%}✓%{$reset_color%},%{$fg[red]%}✗%{$reset_color%})"
PROMPT='${checkmark} %(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%c)%{$reset_color%}%_$(prompt_char) '
RPROMPT='%{$fg_bold[yellow]%}$(git_prompt_info)%{$reset_color%} $(battery_pct_prompt)'

function pubkeycp { pbcopy < $HOME/.ssh/id_rsa.pub }

# use as many cores as possible
export RAKEOPT='-j'
export EDITOR=vim
export CLICOLOR=1

alias rake=drake
alias less='less -r'
alias df='df -h'
alias du='du -h'
alias ll='ls -alh'
alias l='ls -alh'
alias vim='vim -p'
alias vi='vim -p'
alias fname='find . -name'
alias finame='find . -iname'

# set ruby version using rvm (if installed)
RVM=$HOME/.rvm/scripts/rvm
if [[ -f $RVM ]]; then
    . $RVM
	rvm use 1.9.3 &> /dev/null
fi
