# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# turn off suspend 
stty -ixon

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest > 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest > 0 ]]; then bind "set show-all-if-ambiguous On"; fi


# correct minor spelling mistakes in cd commands
shopt -s cdspell

# automatically cd without using cd
shopt -s autocd

# setup for /bin/ls and /bin/grep to support color
if [ -f "/etc/dircolors" ] ; then
        eval $(dircolors -b /etc/dircolors)
fi

if [ -f "$HOME/.dircolors" ] ; then
        eval $(dircolors -b $HOME/.dircolors)
fi


# ignore commands starting with a space and duplicates from being added to history 
HISTCONTROL=ignoreboth
# append to the history file when shell is exited 
shopt -s histappend
# set size of history 
HISTFILESIZE=1000000
HISTSIZE=1000000
# specifically ignore certain commands
HISTIGNORE="&:history:ls:ll:la:ls * ps:ps -A:[bf]g:exit"
# format the history file with a timestamp
HISTTIMEFORMAT='%F %T '
# force multi-line commands to be historized as one line
shopt -s cmdhist
# add history as commands are entered, not when exiting
PROMPT_COMMAND='history -a'
# view the history expansion before executing it
shopt -s histverify

# color in grep
export GREP_OPTIONS=' — color=auto'

# set vim as the default editor
export EDITOR=vim



# aliases
# Additional alias sourced from ~/.bash_aliases,
# instead of adding them here directly.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'


alias h='history | grep '
alias q='exit'
alias c='clear'
alias h=’history’
alias la='ls -a'
alias ll='ls -l'

alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias sha1='openssl sha1'

alias ev='vim ~/.vimrc'
alias eb='vim ~/.bashrc'
alias sb='source ~/.bashrc'