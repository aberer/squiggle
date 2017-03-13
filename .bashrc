# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL="ignoredups ignorespace"

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s cdspell

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

RETURN="\$(ret=\$?; if [[ \$ret = 0 ]];then echo \"\[\033[01;32m\]✓\";else echo \"\[\033[01;31m\]\$ret\";fi)\[\033[00m\]"
PS1="${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] $RETURN \$ "

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

set show-all-if-ambiguous on
set match-hidden-files on
set completion-ignore-case on

# turn off terminal bell
xset -b

export TERM="rxvt"
export GTEST_COLOR=yes
export PYTHONPATH=$PYTHONPATH:~/lib:~/.local/lib/python2.7/site-packages
export PATH=$PATH:/opt/bin/
export LC_NUMERIC=C
export ALTERNATE_EDITOR='emacs --daemon' EDITOR='emacsclient -c' VISUAL='emacsclient -c'

export UNCRUSTIFY_CONFIG=~/.uncrustify.cfg

# TODO: meaning of this?
export LESS="-R $LESS"
export CC="/usr/bin/ccache gcc"
export CXX="/usr/bin/ccache g++"
export EDITOR="emacsclient -c"  VISUAL="emacsclient -c" ALTERNATE_EDITOR=emacs
export TODAY=$(date +"%Y%m%d")

# source machine local code
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi

# TODO: resolution?
umask 0002
umask u=rwx,g=rwx,o=
