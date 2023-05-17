let-env config = {
  show_banner: false,
  keybindings:[
    {
      name: completion_menu
      modifier: none
      keycode: tab
      mode: [emacs vi_normal vi_insert]
      event: {
        until: [
          { send: menu name: completion_menu }
          { send: menunext }
        ]
      }
    }
    {
      name: historycomplete
      modifier: control
      keycode: char_j
      mode: emacs
      event: {send: HistoryHintComplete }
    }
    {
      name: Enter
      modifier: control
      keycode: char_m
      mode: emacs
      event: {send: Enter }
    }
  ]


}


# custom config
alias nv = nvim
alias pip = pip3
alias python = python3
alias - = cd -

# lsd
alias ls = lsd
alias l = lsd -l
alias la = lsd -la
alias j = __zoxide_z

source ~/.zoxide.nu
# fnm env --use-on-cd | source
