#
# ~/.bashrc
#

# Commands to store in session history
# Unset is a large number, -1 is unlimited
HISTSIZE=-1

# Number of commands to store in history file
# Unset is a large number, -1 is unlimited
HISTFILESIZE=-1

export PATH="$PATH:~/.local/bin/"
export PATH="$PATH:~/.local/share/gem/ruby/3.0.0/bin"
export PATH="$PATH:~/go/bin/"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias l='ls -CF'
alias ll='ls -alF'
alias la='ls -A'
alias ls='ls --color=auto'
alias lsa='ls -alF'
alias grep='grep --color=auto'

# Git branch function with space only when needed
function parse_git_branch {
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ -n "$branch" ]; then
    echo " ($branch)"
  fi
}

# PS1 elements
wd="\w"                # working directory
pmt="$"                # prompt sign
usr="\u"               # username
at="@"                 # @
hn="\h"                # hostname

# PS1 colours
usrclr="\[\e[38;5;34m\]"   # username color
atclr="\[\e[38;5;40m\]"    # @ symbol color
hnclr="\[\e[38;5;46m\]"    # hostname color
wdc="\[\e[38;5;154m\]"     # working directory color
gitclr="\[\e[38;5;87m\]"   # git branch color
cr="\[\033[0m\]"           # color reset

# Final PS1 prompt
export PS1="${usrclr}${usr}${atclr}${at}${hnclr}${hn} ${wdc}${wd}${gitclr}\$(parse_git_branch) ${cr}${pmt} "

workcoloursnogit="\[\033[01;32m\]$usr \[\033[01;34m\]$wd \[\033[36m\]AAAA\[\033[35m\]$pmt\[\033[00m\] "

# Default PS1
# PS1='[\u@\h \W]\$ '
