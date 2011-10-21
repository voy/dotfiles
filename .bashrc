# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# virtualenvwrapper - must run even for non-interactive mode
export WORKON_HOME=$HOME/.virtualenvs
if [ -f /usr/local/bin/virtualenvwrapper_bashrc ]; then
	. /usr/local/bin/virtualenvwrapper_bashrc
fi
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
	. /usr/local/bin/virtualenvwrapper.sh
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm-256color) color_prompt=yes;;
	xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
# We have color support; assume it's compliant with Ecma-48
# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
# a case would tend to support setf rather than setaf.)
color_prompt=yes
	else
color_prompt=
	fi
fi

function parse_git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "("${ref#refs/heads/}")"
}

WHITE="\[\033[00m\]"
GREEN="\[\033[01;32m\]"
BLUE="\[\033[01;34m\]"
YELLOW="\[\033[0;33m\]"

if [ "$color_prompt" = yes ]; then
	PS1="$GREEN\u@\h:$BLUE\W$YELLOW \$(parse_git_branch)$WHITE\$ "
else
	PS1="\u@\h:\W \$(parse_git_branch)\$ "
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
	PS1="\[\e]0;\u@\h: \w\a\]$PS1"
	;;
*)
	;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	eval "`dircolors -b`"
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
	alias hglog='hgtk log > /dev/null &'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

if [ -f ~/bin/django_bash_completion ]; then
	. ~/bin/django_bash_completion
fi

# nice colorful manpages
if [ -f /usr/bin/most ]; then
	export MANPAGER="/usr/bin/most -s"
fi

which ack-grep > /dev/null
if [ $? -eq 0 ]; then
	ACK_BINARY=`which ack-grep`
else
	ACK_BINARY=`which ack`
fi

# don't strip color control codes
alias less='less -r'
alias ack=$ACK_BINARY
alias yuicompressor='java -jar ~/bin/yuicompressor.jar'
alias df='df -h'
alias du='du -h'
alias ll='ls -alh'
alias vim='vim -p'
alias vi='vim -p'

# alias for drupal shell
if [ -f ~/Work/drush/drush ]; then
	alias drush='~/Work/drush/drush'
fi

WORKDIR=/home/voy/Work
alias cdwork='cd $WORKDIR'

# I3CZ

alias list_instances_us='AWS_CREDENTIAL_FILE=~/.ec2/comoga.ini list_instances -r us-east-1 -H ID,T:Name,Hostname,IP,State'
alias list_instances_eu='AWS_CREDENTIAL_FILE=~/.ec2/comoga.ini list_instances -r eu-west-1 -H ID,T:Name,Hostname,IP,State'
alias list_instances_us_bw='AWS_CREDENTIAL_FILE=~/.ec2/bidzwin.ini list_instances -r us-east-1 -H ID,T:Name,Hostname,IP,State'
alias list_instances_eu_bw='AWS_CREDENTIAL_FILE=~/.ec2/bidzwin.ini list_instances -r eu-west-1 -H ID,T:Name,Hostname,IP,State'
alias sshtunus='ssh -i /home/voy/.ssh/comoga-us.pem -R 8080:hg.malina:80'

alias cdauction='cd $WORKDIR/auction/auction'
alias cdaffil='cd $WORKDIR/affil/affil/'
alias cdknitting='cd $WORKDIR/knitting'
alias cdbidzwin='cd $WORKDIR/bidzwin/bidzwin'
alias cdwestbids='cd $WORKDIR/bidzwin/bidzwin'
alias cdcasharena='cd $WORKDIR/casharena/casharena'
alias cdbonus='cd $WORKDIR/bonus/bonus'
alias cdsolid='cd $WORKDIR/solid/solid'

# custom compiled vim
export PATH="$HOME/bin/vim/bin:/opt/vim/bin:$HOME/bin:$PATH"

export EDITOR=vim

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end

# autocompletion in python
export PYTHONSTARTUP="/home/voy/.pyrc"

# on macos show colors in terminal
export CLICOLOR=1

if [ `hostname` = "vanderpool" ]; then
	export GIT_AUTHOR_NAME='Vojtech Jasny'
	export GIT_AUTHOR_EMAIL='vojtech.jasny@gooddata.com'
fi

if [ -r ~/.bashrc.local ]; then
	source ~/.bashrc.local
fi

if [ -r ~/bin/git-completion.bash ]; then
	source ~/bin/git-completion.bash
fi
