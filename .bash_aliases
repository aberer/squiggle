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
    if [ "$(pgrep emacs)" == "" ]; then
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

# TODO: extend
function absolute_path { echo "$PWD/$1"; }

alias ap='absolute_path'
