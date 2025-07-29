# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="jonathan"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.

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

# Environment variables
export PATH=$HOME/.local/bin:$PATH

# Add TeX Live to PATH
export PATH=/usr/local/texlive/2025/bin/x86_64-linux:$PATH

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Cargo environment
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Console Ninja
PATH=~/.console-ninja/.bin:$PATH


# GPU and Wayland environment variables
export RADV_PERFTEST=aco
export AMD_VULKAN_ICD=RADV
export WAYLAND_DISPLAY=wayland-1
export XDG_SESSION_TYPE=wayland
export QT_QPA_PLATFORM=wayland
export GDK_BACKEND=wayland

# QMK firmware tab completion
[ -f ~/qmk_firmware/util/qmk_tab_complete.sh ] && source ~/qmk_firmware/util/qmk_tab_complete.sh

# OpenCode
export PATH=/home/webdevcodi/.opencode/bin:$PATH

# Direnv hook
eval "$(direnv hook zsh)"

# Oh My Posh theme
eval "$(oh-my-posh init zsh --config 'https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/kushal.omp.json')"
eval "$(oh-my-posh init bash --config 'https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/kushal.omp.json')"

# Shell switching functions
function tozsh() {
    echo "Already in Zsh!"
}

function tobash() {
    echo "Switching to Bash..."
    exec bash
}
