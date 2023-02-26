# Edit command line in $EDITOR with Ctrl-x-e
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

bindkey "^[[H" beginning-of-line
bindkey "^[OH" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[OF" end-of-line
bindkey "^[[4~" end-of-line
