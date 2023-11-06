# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# {{{
hash -d config=$XDG_CONFIG_HOME
hash -d cache=$XDG_CACHE_HOME
hash -d data=$XDG_DATA_HOME
hash -d zdot=$ZDOTDIR

# About zsh config
export HISTFILE=${ZDOTDIR}/.zsh_history
# 历史纪录条目数量
export HISTSIZE=10000
# 注销后保存的历史纪录条目数量
export SAVEHIST=10000
#以附加的方式写入历史纪录
export HISTTIMEFORMAT="%d/%m/%y %T "
# 消除历史记录中的重复条目
setopt HIST_IGNORE_DUPS
setopt INC_APPEND_HISTORY
# 相同的历史路径只保留一个
setopt HIST_FIND_NO_DUPS
# }}}

eval "$(zoxide init --cmd j zsh)"

# pnpm
export PNPM_HOME=${XDG_DATA_HOME}/pnpm
export PATH=$PNPM_HOME:$PATH
# pnpm end

# fnm
export PATH=$XDG_DATA_HOME/fnm:$PATH
eval "`fnm env`"

# python3
[[ -d /usr/local/python3 ]] && export PATH=/usr/local/python3/bin:$PATH

# golang
[[ -d $HOME/.local/go ]] && export PATH=$HOME/.local/go/bin:$PATH

# nvim
[[ -d $HOME/.local/nvim-linux64 ]] && export PATH=$HOME/.local/nvim-linux64/bin:$PATH

# tools

# bat
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANPAGER='sh -c "col -bx | bat -pl man --theme=Monokai\ Extended"'
export MANROFFOPT='-c'
alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}

## Use emacs key bindings
bindkey -e

. ~/.config/zsh/plugins.zsh

# fzf
. ~/.config/fzf/fzf.zsh

# atuin
export ATUIN_NOBIND="true"
eval "`atuin init zsh`"


# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
# autoload -Uz cdr



. ~/.config/zsh/aliases.zsh
. ~/.config/zsh/functions.zsh

# zsh-autocomplete 配置
bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
# 让 Enter 直接从菜单提交命令行
bindkey -M menuselect '\r' .accept-line

bindkey '^j' autosuggest-execute
bindkey '^r' _atuin_search_widget
bindkey -s '^[l' 'lsd -la\n'
