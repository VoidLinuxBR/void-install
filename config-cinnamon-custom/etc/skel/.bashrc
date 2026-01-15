# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/bin:/usr/games:/sbin:$HOME/bin"

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# Cores - Substitua pelos códigos ANSI do seu terminal, se necessário
GREEN="\033[1;32m"   # Verde
RED="\033[1;31m"     # Vermelho
YELLOW="\033[1;33m"  # Amarelo
BLUE="\033[1;34m"    # Azul
MAGENTA="\033[1;35m" # Magenta
CYAN="\033[1;36m"    # Ciano
RESET="\033[0m"      # Resetar as cores

# Normal Colors
Black='\e[0;30m'  # Black
Red='\e[0;31m'    # Red
Green='\e[0;32m'  # Green
Yellow='\e[0;33m' # Yellow
Blue='\e[0;34m'   # Blue
Purple='\e[0;35m' # Purple
Cyan='\e[0;36m'   # Cyan
White='\e[0;37m'  # White

# Bold
BBlack='\e[1;30m'  # Black
BRed='\e[1;31m'    # Red
BGreen='\e[1;32m'  # Green
BYellow='\e[1;33m' # Yellow
BBlue='\e[1;34m'   # Blue
BPurple='\e[1;35m' # Purple
BCyan='\e[1;36m'   # Cyan
BWhite='\e[1;37m'  # White

# Background
On_Black='\e[40m'        # Black
On_Red='\e[41m'          # Red
On_Green='\e[42m'        # Green
On_Yellow='\e[43m'       # Yellow
On_Blue='\e[44m'         # Blue
On_Purple='\e[45m'       # Purple
On_Cyan='\e[46m'         # Cyan
On_White='\e[47m'        # White
NC="\e[m"                # Color Reset
ALERT=${BWhite}${On_Red} # Bold White on red background

# Função para obter o status do último comando
function get_exit_status() {
  local status="$?"
  if [ $status -eq 0 ]; then
    echo -e "${YELLOW}${status} ${GREEN}✔${RESET}"
  else
    echo -e "${YELLOW}${status} ${RED}✘${RESET}"
  fi
}

HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history.
shopt -s histappend    # append to the history file, don't overwrite it
HISTSIZE=1000          # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILESIZE=2000      # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
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

if [ "$color_prompt" = yes ]; then
  PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ \$(get_exit_status) "
else
  PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$ \$(get_exit_status) "
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
	PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	;;
*) ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

[ -f /usr/share/doc/pkgfile/command-not-found.bash ] && source /usr/share/doc/pkgfile/command-not-found.bash
[ -f ~/.fzf.bash ] && . ~/.fzf.bash
[ -f ~/.bashrcfull ] && . ~/.bashrcfull
[ -f ~/.bashrckali ] && . ~/.bashrckali
[ -f /etc/bashrc ] && . /etc/bashrc
[ -f ~/.bashrckali ] && . ~/.bashrckali
#
#if ((EUID != 0)); then
#	#	export PS1="$green\u$yellow@$cyan\h$red in $reset\w\n#"
#	#	export PS1="${green}\u${yellow}@${cyan}\h${red}:\w\$(get_exit_status) ${reset}\$ "
##	export PS1="${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV)) }${debian_chroot:+($debian_chroot)}${GREEN}\u${YELLOW}@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$(get_exit_status) "
#	export PS1="${GREEN}\u${YELLOW}@${CYAN}\h${MAGENTA}:\w${NC} \$(get_exit_status) "
#else
#	#	export PS1="$red\u$yellow@$cyan\h$red in $reset\w\n#"
#	#	export PS1="${red}\u${yellow}@${reverse}${orange}${reset}\h${red}:\w\$(get_exit_status) ${reset}# "
##	export PS1="${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV)) }${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$(get_exit_status) "
#	export PS1="${RED}\u@\h${NC}:${BLUE}\w${NC} \$(get_exit_status) "
#fi
export PS2="\[${yellow}\]→ \[${reset}\]"
export PS4=$'${red}${0##*/}${green}[$FUNCNAME]${pink}[$LINENO]${reset} '
# . /usr/share/blesh/ble.sh
# . ~/.ps1
# . ~/.ps1ok
# . ~/.ps1powerline

# Load pyenv automatically by appending
# the following to
# ~/.bash_profile if it exists, otherwise ~/.profile (for login shells)
# and ~/.bashrc (for interactive shells) :

if command -v pyenv >/dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# ----- GRC-RS Configuration -----
# Enable colorized output for various commands
GRC="/usr/bin/grc-rs"
if tty -s && [ -n "$TERM" ] && [ "$TERM" != "dumb" ] && command -v "$GRC" >/dev/null; then

  # Define um alias para facilitar a aplicação do grc-rs nos comandos.
  alias colourify="$GRC"

  # Lista de comandos que serão configurados para saída colorida.
  commands=(
    ant blkid configure df diff dig dnf docker-machinels dockerimages dockerinfo
    dockernetwork dockerps dockerpull dockersearch dockerversion du fdisk
    findmnt go-test ifconfig iostat_sar ip ipaddr ipneighbor iproute iptables
    irclog iwconfig kubectl last ldap lolcat lsattr lsblk lsmod lsof lspci
    lsusb mount mtr mvn netstat nmap ntpdate ping ping2 proftpd pv
    semanageboolean semanagefcontext semanageuser sensors showmount sockstat
    ss stat sysctl tcpdump traceroute tune2fs ulimit uptime vmstat wdiff yaml
  )

  # Itera pela lista de comandos e cria um alias apenas se o comando existir.
  for cmd in "${commands[@]}"; do
    if command -v "$cmd" >/dev/null; then
      alias "$cmd"="colourify $cmd"
    fi
  done

  # Remove as variáveis temporárias para evitar poluição do ambiente.
  unset commands cmd
fi

# Set GCC color settings for error and warning messages
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Use 'bat' as a replacement for 'cat' with improved output formatting if available
if [ -f /usr/bin/bat ]; then
  cat() {
    local use_cat=false
    # Check if any argument contains -v, -e, -t or their combinations
    for arg in "$@"; do
      if [[ "$arg" =~ ^-[vet]+$ ]]; then
        use_cat=true
        break
      fi
    done

    # If no special options, use bat
    if [ "$use_cat" == true ]; then
      command cat "$@"
    else
      bat --paging=never --style=plain "$@"
    fi
  }

  # Customize the 'help' command to display colorized output
  help() {
    if [ $# -eq 0 ]; then
      command help
    else
      "$@" --help 2>&1 | bat --paging=never --style=plain --language=help
    fi
  }
fi

welcome() {
  if command -v hostnamectl >/dev/null; then
    hostnamectl
    echo
  fi

  timenow="$(date +'%H:%M')"
  load="$(awk '{print $1 ", " $2 ", " $3}' /proc/loadavg)"

  echo -e "${BCyan}This is BASH ${BRed}${BASH_VERSION%.*}${BCyan}- DISPLAY on ${BRed}$DISPLAY${NC}\n"
  date
  timenow="$(date +'%H:%M')"
  load="$(awk '{print $1 ", " $2 ", " $3}' /proc/loadavg)"
  printf 'Welcome back! The time now is %s UTC\n' "$timenow"
  printf "Server load    :  ${BYellow}%s${NC}\n" "$load"
  printf "Server Uptime  : ${BYellow}%s\n${NC}" "$(uptime)"
  printf "User           :  ${BYellow}%s %s\n${NC}" "$(whoami)" "$(id)"
  printf "Link to distro :  ${BYellow}https://chililinux.com/ \n${NC}"
  printf "Desktop        :  ${BYellow}$XDG_CURRENT_DESKTOP \n${NC}"
  printf "Session        :  ${BYellow}$XDG_SESSION_TYPE \n${NC}"
}

welcome
if [ -n "$DISPLAY" ] && [ -e "$HOME/.Xauthority" ]; then
  export XAUTHORITY=$HOME/.Xauthority
fi

#eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
