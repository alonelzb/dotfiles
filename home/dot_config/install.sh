if [[ ! -e $HOME/.config ]]; then
	ln -s $HOME/dot_config $HOME/.config
	ln -s $HOME/dot_config/.zshenv $HOME/.zshenv
fi

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

if [ ! -e $HOME/.local/nvim-linux64 ]; then
	install_neovim
fi


curl -fsSL https://fnm.vercel.app/install | sh

pip3 install requests tqdm sh 
python3 $HOME/.config/scripts/install.py

#npm i -g neovim

echo done
