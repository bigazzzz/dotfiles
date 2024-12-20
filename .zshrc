export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time
# zstyle ':omz:update' frequency 13 # Uncomment the following line to change how often to auto-update (in days).
# DISABLE_MAGIC_FUNCTIONS="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(
        kube-ps1
        git
        sudo
        colored-man-pages
        zsh-syntax-highlighting
        zsh-autosuggestions
        command-time
        kubetail
        tmux
        safe-paste
        copyfile
        copybuffer
        dirhistory
        history
        jsontools
        alias-finder
        direnv
)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment

# install git-prompt.zsh
# https://github.com/woefe/git-prompt.zsh
[ -d ~/.zsh ] || mkdir ~/.zsh
[ -d ~/.zsh/git-prompt.zsh ] || git clone --depth=1 https://github.com/woefe/git-prompt.zsh ~/.zsh/git-prompt.zsh
[ -f ~/.zsh/git-prompt.zsh/git-prompt.zsh ] && source ~/.zsh/git-prompt.zsh/git-prompt.zsh
[ -f ~/.zsh/git-prompt.zsh/examples/multiline.zsh ] && source ~/.zsh/git-prompt.zsh/examples/multiline.zsh

# upload my env
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
