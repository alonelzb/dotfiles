#!/bin/bash
#
if [ ! -e $HOME/.local ]; then
	mkdir -p $HOME/.local/bin
fi

if [ ! -e $HOME/.tmp ]; then
	mkdir $HOME/.tmp
fi

install_neovim() {
	wget https://github.com/neovim/neovim-releases/releases/download/nightly/nvim-linux64.tar.gz -P $HOME/.tmp
	tar xf $HOME/.tmp/nvim-linux64.tar.gz -C ~/.local/
}

install_zsh() {
	wge https://www.zsh.org/pub/zsh-5.9.tar.xz -P $HOME/.tmp
	tar xf $HOME/zsh-5.9.tar.xz -C $HOME/.tmp/
	cd $HOME/.tmp/zsh-5.9
	./configure
	make && make install
	echo '/usr/loca/bin/zsh' >>/etc/shells
	usermod -s /usr/local/bin/zsh $USER
}

# 编译安装zsh
if [ ! -e /usr/local/bin/zsh ]; then
	install_zsh
fi

# 安装neovim
if [ ! -e $HOME/.local/nvim-linux64 ]; then
	install_neovim
fi

if [ ! -e $HOME/.vim/autoload/plug.vim ]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

curl -fsSL https://fnm.vercel.app/install | sh

# 安装chezmoi 并初始化
# sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin

pip3 install requests tqdm sh rich
python3 $HOME/.config/scripts/install.py

#npm i -g neovim

echo done
