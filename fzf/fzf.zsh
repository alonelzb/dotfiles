# Setup fzf
# ---------
if [[ ! "$PATH" == */home/zbluo/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/zbluo/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/zbluo/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/zbluo/.fzf/shell/key-bindings.zsh"

# custom
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --follow --hidden --exclude .git --color=always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:#af87ff,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'
#W 历史记录
export FZF_CTRL_R_OPTS='--no-sort --exact'
