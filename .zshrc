
#
# Set PATHS
#
#export PATH="$PATH:/usr/local/bin:/bin:/usr/bin:/usr/lib/:/usr/X11R6/bin:/usr/games/"
#export XLIB_SKIP_ARGB_VISUALS=1
#ARCH=x86_64
#export ARCH
#export SBCL_HOME=/usr/lib/sbcl
#export LC_CTYPE="el_GR.UTF-8"
#export LC_MESSAGES="en_US.UTF-8"

export OPERAPLUGINWRAPPER_PRIORITY=0
export OPERA_KEEP_BLOCKED_PLUGIN=1
#export PATH="/usr/lib/cw:$PATH"

#
# sloc economy.. use categorized files
#

source $HOME/.zsh/dircolors.zsh

#
# Default apps
#
  (( ${+BROWSER} )) || export BROWSER="opera"
  (( ${+PAGER} ))   || export PAGER="less"

#
# Aliases
#
alias ll='ls -hAlv --group-directories-first --color=always'
alias ls='ls -CA --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias cd..='cd ..'
alias m='cd /mnt/mercury'
alias d='cd /mnt/mercury/Docs'
alias mov='cd /mnt/mercury/Movies'
alias mus='cd /mnt/mercury/Music'
alias cp='cp -i'
alias rm='rm -rfi'
alias mv='mv -i'
alias edit='nano -w'
alias ps='ps aux'
alias pg='ps aux | grep -i'
alias duh='du -h --max-depth=1'
alias cp1='rsync -av -stats --progress'
alias poweroff='sudo /sbin/shutdown -h now'
alias monitoroff='sleep 1 && xset dpms force off'
alias mplayer='mplayer -msgcolor -msgmodule'
alias todo='emacs ~/ToDo'
alias eg='emacs --unibyte'
alias et='emacs -nw'
alias emacsrss='emacs -f newsticker-treeview'
alias frozen-bubble='frozen-bubble --private'
#eval `dircolors $HOME/.dir_colors`

#
# Completion Style settings
#

setopt autocd cdablevars extendedglob globcomplete autolist  
setopt interactive login monitor correctall globdots longlistjobs
setopt zle autopushd interactivecomments notify recexact prompt_subst
setopt complete_in_word extended_history pushdtohome autoresume 
setopt histignoredups pushdsilent pushdminus rcquotes MAGIC_EQUAL_SUBST 
#unsetopt equals

#
# Modules
#
zmodload -a zshcompsys
zmodload -a colors
zmodload -a autocomplete
zmodload -a complist
zmodload -a terminfo
zmodload -a parameter
zmodload -a compctl
zmodload -a computil
autoload -U compinit promptinit
compinit
promptinit
autoload -U zsh-mime-setup
zsh-mime-setup
autoload -U colors 
colors
autoload -U url-quote-magic
zle -N self-insert url-quote-magic



#
# Completion --woohooo, its chaotic so lets add some comments here
#

# Give color 
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:(options|values)' list-colors     '=(#b)(*)-- (*)=31;1=36;1=32;1' '=*=36;1'

# Killin
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=01;36=01;31' 
zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*=01;36=01;31' 
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' command 'ps --forest -au $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:kill:*' insert-ids single
zstyle ':completion:*:kill:*' force-list always
# options
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*' completer  _oldlist _expand _force_rehash _complete _correct _match _approximate _ignored _expand _prefix
zstyle ':completion:*::::' completer  _oldlist _expand _force_rehash _complete _correct _match _approximate _ignored _expand _prefix
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' list-suffixes true

#procs
zstyle ':completion:*:processes' command 'ps -axw'
zstyle ':completion:*:processes-names' command 'ps -awxho command'

# Correction message format
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
SPROMPT="Correct %B%{${fg[red]}%}'%R'%{${reset_color}%}%b to %B%{${fg[green]}%}'%r'%{${reset_color}%}%b? %B%{${fg[white]}%} [No, Yes, Abort, Edit]%{${reset_color}%}%b: "


# Fuzzy Completion
zstyle ':completion:*:match:*' original only
#zstyle ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/2))numeric)' 
zstyle ':completion:*:approximate:*' max-errors 'reply=(  $((  ($#PREFIX+$#SUFFIX)/3  ))  )'

# Caching (?)
zstyle ':completion::complete:*' use-cache 1 
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST
# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} m:{a-zA-Z}={A-Za-z}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'

# Messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format $'\e[01;33m-- %B%d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;31m %d \e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No matches found for %d --\e[0m'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' select-prompt '%SScrolling Percentage: %p%s'


# Generate descriptions with magic.
zstyle ':completion:*' auto-description 'specify: %d'

# No huge list, page it
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# No huge list, menu it
zstyle ':completion:*:default' menu 'select=0'

# Have the newer files last so I see them first..clears the mess
zstyle ':completion:*' file-sort name #modification reverse

zstyle :compinstall filename '/home/shevek/.zshrc'

# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions


#
# Functions
#


_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1	# Because we didn't really complete anything
}

# Easy zip directories plus some filters

zipdir() { zip "$@".zip -r "$@" -x  "*/.svn/*" }

# Extract files from any archive
extr () 
 {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xjfv $1 ;;
      *.tar.gz) tar xzfv $1 ;;
      *.bz2) bunzip2 $1 ;;
      *.rar) rar x $1 ;;
      *.gz) gunzip $1 ;;
      *.tar) tar xfv $1 ;;
      *.tbz2) tar xjvf $1 ;;
      *.tgz) tar vxzf $1 ;;
      *.zip) unzip $1 ;;
      *.Z) uncompress $1 ;;
      *.7z) 7z x $1 ;;
      *.rar) unrar e $1 ;;
      *) echo "'$1' cannot be extracted via extract()" ;;
   esac
  else
      echo "'$1' is not a valid file"
  fi 
 }


# Quick jump to a directory without typing full path
rationalise-dot() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}
zle -N rationalise-dot
bindkey . rationalise-dot




#
# History
#

SAVEHIST=10000
HISTSIZE=10000
HISTFILE=~/.history

#
# Key bindings
#
bindkey '\e[A'  up-line-or-history
bindkey '\e[B'  down-line-or-history
bindkey '\e[C'  forward-char
bindkey '\e[D'  backward-char
bindkey '\eOA'  up-line-or-history
bindkey '\eOB'  down-line-or-history
bindkey '\eOC'  forward-char
bindkey '\eOD'  backward-char


bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "^H" backward-delete-word
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix

#
# Simple prompt
#
# PROMPT=$'%n@%m-%D{ %/[%t]$' 
#


#
# My prompt
#

#if [[ $UID == 0 ]]; then
#PS1=$'%{\e[1;37m%}> %{\e[0;36m%}[%0(3c,../%3c,%~)/]
#%{\e[1;36m%}> %{\e[0;34m%}%m %0(?,%{\e[0;32m%}*,%{\e[0;31m%}*%s) %{\e[0;31m%}%#%{\e[0m%} '

#RPS1=$'%{\e[2;37m%}[%B%T ~ %w%b%{\e[0;37m%}]%{\e[0m%}'

#else
#PS1=$'%{\e[1;36m%}> %{\e[0;36m%}[%0(3c,../%3c,%~)/]
#%{\e[1;36m%}> %{\e[0;34m%}%m%0(?,%{\e[0;32m%} *,%{\e[0;31m%}*%s) %{\e[0;36m%}%#%{\e[0m%} '

#RPS1=$'%{\e[0;37m%}[%B%T ~ %w%b%{\e[0;37m%}]%{\e[0m%}'
#fi

local curdir="%d"
local hostname="%M"
local username="%n"
local bold="%B"
local unbold="%b"
local standout="%S"
local unstandout="%s"
local colorfg="%F"
local uncolorfg="%f"
local colorbg="%K"
local uncolorbg="%k"
local mytime="%*"
local mydate="%D"
local line_tty="%y"
local rootorwhat="%#"
local return_status="%?"

PROMPT="$uncolorfg [$colorfg{blue}$curdir$unbold$uncolorfg]
$colorfg{blue}$unbold →$uncolorfg "









