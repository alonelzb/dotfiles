# 安装zinit
# ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# [ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
# [ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# . $ZINIT_HOME/zinit.zsh

# 补全
# zinit ice lucid wait; zinit light Aloxaf/fzf-tab
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'

# 提示
# zinit ice lucid wait atload='_zsh_autosuggest_start'; zinit light zsh-users/zsh-autosuggestions

# prompt
# zinit ice depth=1; zinit light romkatv/powerlevel10k

# 语法高亮
# zinit ice lucid wait atinit='zpcompinit'; zinit light zdharma-continuum/fast-syntax-highlighting
#
#


# 2023-07-28
# znap
# install zsh plugins by znap
znap_dir="$HOME/.local/share/znap"
[[ -f $znap_dir/znap/znap.zsh ]] || git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git $znap_dir/znap
zstyle ':znap:*' repos-dir $znap_dir
. $znap_dir/znap/znap.zsh  # Start Znap


znap source marlonrichert/zsh-autocomplete
znap source zdharma-continuum/fast-syntax-highlighting
znap source zsh-users/zsh-autosuggestions
znap source romkatv/powerlevel10k
