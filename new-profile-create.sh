#!/usr/bin/env sh

cd $HOME

sudo apt-get update -y \
	&& sudo apt-get dist-upgrade -y \
	&& sudo apt-get autoremove -y \
	&& sudo apt-get autoclean

sudo apt-get install -y \
	curl \
	wget \
	git \

sudo apt-get install -y zsh
chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

#
# Install NERD Fonts
#
curl --create-dirs --output-dir ~/.local/share/fonts -fLO https://raw.githubusercontent.com/ryanoasis/nerd-fonts/refs/heads/master/patched-fonts/IosevkaTerm/IosevkaTermNerdFontMono-Regular.ttf
fc-cache -f -v

# install zsh-autosuggestions plugin
[ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ] || git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# install zsh-syntax-highlighting plugin
[ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ] || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# install kubetail plugin
[ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/kubetail ] || git clone https://github.com/johanhaleby/kubetail.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/kubetail
[ -f /usr/local/share/zsh/site-functions/_kubetail ] || sudo curl https://raw.githubusercontent.com/johanhaleby/kubetail/master/completion/kubetail.zsh -o /usr/local/share/zsh/site-functions/_kubetail
# install command-time plugin
[ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/command-time ] || git clone https://github.com/popstas/zsh-command-time.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/command-time

# add default directories
#

[ -d ~/git ] || mkdir ~/git
[ -d ~/projects ] || mkdir ~/projects
[ -d ~/.local/bin ] || mkdir ~/.local/bin

[ -d ~/git/dotfiles ] && rm -rf ~/git/dotfiles
git clone https://github.com/bigazzzz/dotfiles.git ~/git/dotfiles

cp -f ~/git/dotfiles/.zshrc* ~/

cp -rf ~/git/dotfiles/.ssh ~
mkdir -p ~/.ssh/sockets

cp -rf ~/git/dotfiles/scripts ~

cp -rf ~/git/dotfiles/.aliases.d ~

cp -f ~/git/dotfiles/.dockerignore ~
cp -f ~/git/dotfiles/.gitconfig ~

cp -rf ~/git/dotfiles/.tmux ~
cp -f ~/git/dotfiles/.tmux.conf ~

# install nodejs for coc.vim
# нужна экспертиза
#cp -rf ~/git/dotfiles/.vim ~
#cp -f ~/git/dotfiles/.vimrc ~

# install kubectl
curl -o /usr/local/bin/kubectl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x /usr/local/bin/kubectl

# install helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# install other applications
sudo apt-get install -y \
	mc \
	tmux \
	vim \
	htop \
	fonts-powerline	\
	direnv

rm -rf ~/git/dotfiles
