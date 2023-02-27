0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"
THEME_DIR="${0:A:h}"

source "$THEME_DIR/zsh-syntax-highlighting.zsh"
source "$THEME_DIR/ls-colors.zsh"

# For micro
export COLORTERM="truecolor"
export MICRO_TRUECOLOR=1

# Configure fzf preview differently on mobile
local columns=$(tmux display-message -p "#{window_width}" || tput cols)
if [ $columns -lt 100 ]; then
  export FZF_DEFAULT_PREVIEW_WINDOW_OPTS="down:70%:wrap"
else
  export FZF_DEFAULT_PREVIEW_WINDOW_OPTS="right:70%:wrap"
fi

# fzf catpuccin theme
export FZF_DEFAULT_OPTS="
--color=dark
--color=bg+:-1,bg:-1,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
--preview-window='$FZF_DEFAULT_PREVIEW_WINDOW_OPTS'
"

# Apply theme to file list in completions
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
