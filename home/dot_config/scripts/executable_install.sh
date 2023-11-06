#! /usr/bin/bash

[[ -d $HOME/.tmp/ ]] || mkdir ~/.tmp
bin_path=$HOME/.local/bin

green_print() {
    # echo -e "\e[32m$1\e[0m"
    printf "\e[32m$1\e[0m\n"
}

red_print() {
    # echo -e "\e[32m$1\e[0m"
    printf "\e[31m$1\e[0m\n"
}

cheat(){
    [[ -f ~/.local/bin/cheat ]] && echo -e "\e[32mcheat in ~/.local/bin\e[0m" && return
    cd ~/.tmp
    echo -e "\e[32mdownloading cheat ...\e[0m"
    wget 'https://github.com/cheat/cheat/releases/download/4.4.0/cheat-linux-amd64.gz'
    gunzip cheat-linux-amd64.gz
    mv cheat-linux-amd64 ~/.local/bin/cheat
    chmod +x ~/.local/bin/cheat

}

go() {
    # [[ -d ~/.local/go ]] && echo -e "\e[32mgolang in ~/.local/go\n\e[0m" && return
    [[ -d $HOME/.local/go ]] && green_print `which go` && return

    red_print 'golang not found'
    cd $HOME/.tmp/
    # wget 'https://go.dev/dl/go1.21.0.linux-amd64.tar.gz'
    tar xzf go* -C ~/.local/

}

lazygit() {
    # command -v lazygit > /dev/null 2>&1 &&  echo `lsd` || echo 'no'
    [[ -x $bin_path/lazygit ]] && printf "\e[32mlazygit in $bin_path\e[0m\n" && return

    red_print 'lazygit not found'

    url=`curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep 'browser_download_url.*Linux_x86_64.tar.gz'`
    url=${url#*: }
    wget -P $HOME/.tmp/ ${url//\"/}  && tar xf $HOME/.tmp/lazygit* -C $HOME/.local/bin/ lazygit && green_print "lazygit installed in $HOME/.local/bin"
    # wget $url -O $HOME/.tmp/
}

$1
