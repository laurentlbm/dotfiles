typeset -A key
key=(
    BackSpace  "${terminfo[kbs]}"
    Home       "${terminfo[khome]}"
    End        "${terminfo[kend]}"
    Insert     "${terminfo[kich1]}"
    Delete     "${terminfo[kdch1]}"
    Up         "${terminfo[kcuu1]}"
    Down       "${terminfo[kcud1]}"
    Left       "${terminfo[kcub1]}"
    Right      "${terminfo[kcuf1]}"
    PageUp     "${terminfo[kpp]}"
    PageDown   "${terminfo[knp]}"
)

# Edit command line in $EDITOR with Ctrl-x-e
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^xe'  edit-command-line
bindkey '^x^e' edit-command-line

# Bind HOME & END
bindkey "$key[Home]" beginning-of-line
bindkey "$key[End]"  end-of-line

bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# UP & DOWN
bindkey "$key[Up]"   history-substring-search-up
bindkey "$key[Down]" history-substring-search-down
