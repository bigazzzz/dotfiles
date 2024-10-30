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
        history-substring-search
        copyfile
        copybuffer
        dirhistory
        history
        emoji
        jsontools
)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
export LANG=en_US.UTF-8

if [ -f ~/.zsh/git-prompt.zsh/git-prompt.zsh ]; then source ~/.zsh/git-prompt.zsh/git-prompt.zsh; fi
if [ -f ~/.zsh/git-prompt.zsh/examples/multiline.zsh ]; then source ~/.zsh/git-prompt.zsh/examples/multiline.zsh; fi
if [ -f ~/.zshrc.local ]; then source ~/.zshrc.local; fi
