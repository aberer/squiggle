# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

function startEmacsIfNotThere
{
    if [ $( ps aux | grep -c "emacs.*--daemon" ) -lt 2 ]; then
        emacs --daemon
    fi
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i \
"$([ $? = 0 ] && echo terminal || echo error)" \
"$(history|tail -n1 | sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias f="startEmacsIfNotThere; emacsclient -c -n"
alias e="startEmacsIfNotThere; emacsclient -t"

alias asdf='setxkbmap de neo'
alias uiae='setxkbmap de'

alias am="alsamixer"
alias mv="mv -i"
alias cp="cp -i"
alias o="okular"
alias mkdir="mkdir -p"

alias R="R --no-save"

alias cd="pushd"
alias bd="popd"
alias make="make -j2"
alias dc=cd
alias sl=ls
alias ssh='ssh -X'

function absolute_path
{
    if [ "$(echo $1 | cut -c 1)" == "/"  ]; then
        arg=$1
    else
        arg=$PWD/$1
    fi

    python -c "import os,sys; print os.path.abspath(sys.argv[1])" $arg
}

alias ap='absolute_path'
