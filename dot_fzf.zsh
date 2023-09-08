# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/ossareh/.local/share/rtx/installs/fzf/0.42.0/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/ossareh/.local/share/rtx/installs/fzf/0.42.0/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/ossareh/.local/share/rtx/installs/fzf/0.42.0/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/ossareh/.local/share/rtx/installs/fzf/0.42.0/shell/key-bindings.zsh"
