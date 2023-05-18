
#use 'C:\Users\zaibo\AppData\Roaming\nushell\oh-my-minimal.nu' get_prompt
# let-env PROMPT_COMMAND = { (get_prompt).left_prompt }
# let-env PROMPT_COMMAND_RIGHT = { (get_prompt).right_prompt }

# let-env PROMPT_COMMAND = { (git_prompt).left_prompt }
# let-env PROMPT_COMMAND_RIGHT = { (git_prompt).right_prompt }

let-env PROMPT_INDICATOR = { "〉" }
# let-env PROMPT_INDICATOR_VI_INSERT = { ": " }
# let-env PROMPT_INDICATOR_VI_NORMAL = { "〉" }
# let-env PROMPT_MULTILINE_INDICATOR = { "::: " }

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | split row (char esep) | prepend '/some/path')

# fnm config
let-env Path = ($env.Path | split row (char esep) | prepend '~/.fnm')
load-env (fnm env --shell bash | lines | str replace 'export ' '' | str replace -a '"' '' | split column = | rename name value | where name != "FNM_ARCH" and name != "PATH" | reduce -f {} {|it, acc| $acc | upsert $it.name $it.value })
let-env Path = ($env.Path | split row (char esep) | prepend $"($env.FNM_MULTISHELL_PATH)")

zoxide init --cmd j nushell | save -f ~/.zoxide.nu
