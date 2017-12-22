# .bashrc written by Georgios Lyras

# history options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
shopt -s cmdhist



HISTSIZE=1000000
HISTFILESIZE=1000000
HISTCONTROL=ignoreboth
HISTIGNORE='ls:bg:fg:history'
HISTTIMEFORMAT='%F %T '

# aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ..='cd ..'

# append ls color by file type
eval $( dircolors -b $HOME/.dircolors )

# completion
shopt -s autocd
shopt -s cdspell 
shopt -s extglob
shopt -s histappend
shopt -s lithist
shopt -s dotglob
shopt -s nocaseglob
shopt -s nocasematch
shopt -s checkwinsize



if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



# prompt
#force_color_prompt=yes 

if [[ -f "${HOME}/.bash_profile" ]]; then
	# shellcheck source=/dev/null
	source "${HOME}/.bash_profile"
fi

