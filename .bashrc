# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

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
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
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
	# shellcheck disable=SC2015
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
	# shellcheck disable=SC1090
	. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
# if ! shopt -oq posix; then
# 	if [ -f /usr/share/bash-completion/bash_completion ]; then
# 		# shellcheck disable=SC1091
# 		. /usr/share/bash-completion/bash_completion
# 	elif [ -f /etc/bash_completion ]; then
# 		# shellcheck disable=SC1091
# 		. /etc/bash_completion
# 	fi
# fi

export NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1091
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# shellcheck disable=SC1091
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Git related alias's
alias gs='git status'
alias gaa='git add .'
alias gcm='git commit -m '
alias gpu='git push -u origin '
alias gpo='git push origin main'
alias gp="git pull"
alias gcb='git checkout -b '
alias gc='git clone '
alias gagc='git add . && git commit -m " "'

# Development related alias's
alias c.='code .'
alias curs.='cursor .'
alias nv='nvim'
alias z.='zed .'
alias ni='npm install'
alias nrd='npm run dev'
alias vite.='npm create vite@latest .'
alias vite='npm create vite@latest '
alias nss='npm start'
alias cl='clear'
alias nrb='npm run build'
alias nirrd="npm install react-router-dom"
# Start json-server with in project folder
alias njs='npx json-server db.json'
alias esl='npm init @eslint/config@latest'
alias pre='npm install --save-dev --save-exact prettier'

# Install biome in project folder
alias npib='npm install --save-dev --save-exact @biomejs/biome'
alias nbi='npx @biomejs/biome init'

alias ka='flatpak run org.kde.krita'

# Linux related sudo pacman -Sye updates
alias pu='sudo pacman -Sy'

# List possible upgrades
alias uul='apt list --upgradable'

# Install Arch possible updates
alias au='sudo pacman -Syu'

# Open Windsurf IDE in current directory
alias wind='windsurf .'

# shellcheck disable=SC1091
. "$HOME/.cargo/env"

PATH=~/.console-ninja/.bin:$PATH

cursor() {
	/usr/share/cursor/cursor.AppImage "$@"
}

# Tmux aliases
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias td='tmux detach'
alias tdev='~/dev-session.sh'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

# Tmux plugins
alias tpm='tmux plugin-manager'
alias tpmu='tmux plugin-manager update'
alias tpmi='tmux plugin-manager install'
alias tpmr='tmux plugin-manager remove'

alias tcr='tmux source-file ~/.tmux.conf && tmux display-message "Config reloaded!"'
alias tcrs='tmux source ~/.tmux.conf'

export PATH=$HOME/.local/bin:$PATH

# Add TeX Live to PATH
PATH=/usr/local/texlive/2025/bin/x86_64-linux:$PATH

# eval "$(starship init bash)"

eval "$(oh-my-posh init bash --config 'https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/kushal.omp.json')"

# shellcheck disable=SC1090
source ~/qmk_firmware/util/qmk_tab_complete.sh

# opencode
export PATH=/home/webdevcodi/.opencode/bin:$PATH

export RADV_PERFTEST=aco
export AMD_VULKAN_ICD=RADV
export WAYLAND_DISPLAY=wayland-1
export XDG_SESSION_TYPE=wayland
export QT_QPA_PLATFORM=wayland
export GDK_BACKEND=wayland
eval "$(direnv hook bash)"

# Enhanced bash completion
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		# shellcheck disable=SC1091
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		# shellcheck disable=SC1091
		. /etc/bash_completion
	fi
fi

# fzf integration for fuzzy finding
# shellcheck disable=SC1091
source /usr/share/fzf/key-bindings.bash
# shellcheck disable=SC1091
source /usr/share/fzf/completion.bash

# Better history search
bind "\"\\e[A\": history-search-backward"
bind "\"\\e[B\": history-search-forward"

# Shell switching functions
function tozsh() {
	echo "Switching to Zsh..."
	exec zsh
}

function tobash() {
	echo "Already in Bash!"
}

