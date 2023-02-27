# Always run in tmux
[[ -z "$TMUX" ]] && {
  tmux
  exit
}

# Use zgenom to manage plugins
ZGEN_SOURCE="${XDG_CACHE_HOME}/zgenom"
if [ ! -e "${ZGEN_SOURCE}/zgenom.zsh" ]; then
  git clone https://github.com/jandamm/zgenom.git "$ZGEN_SOURCE"
fi
source $ZGEN_SOURCE/zgenom.zsh

# Update zgenom and plugins every 7 days
zgenom autoupdate --background

if ! zgenom saved
then
  zgenom compdef

  # zgenom extension
  zgenom load jandamm/zgenom-ext-eval

  # Shell config I didn't know where else to put...
  zgenom load $ZDOTDIR/stuff.zsh

  # Configure built-in history management.
  zgenom load mattmc3/zephyr plugins/history

  # Load ohmyzsh plugins
  zgenom ohmyzsh
  zgenom ohmyzsh plugins/git  # git aliases
  zgenom ohmyzsh plugins/sudo # prefix command with sudo with <ESC><ESC>

  # Configure built-in completion system.
  zgenom load z-shell/zsh-fancy-completions

  # Add tons of completion definitions.
  zgenom load clarketm/zsh-completions

  # Use fzf for tab completions.
  zgenom load Aloxaf/fzf-tab
  zgenom eval <<EOF
    zstyle ':fzf-tab:*' show-group none
EOF

  # Syntax highlighting
  zgenom load zsh-users/zsh-syntax-highlighting

  # Fish-like fast/unobtrusive autosuggestions for zsh.
  zgenom load zsh-users/zsh-autosuggestions

  # Auto-close and delete matching delimiters.
  zgenom load hlissner/zsh-autopair

  # Suggestions when command not found.
  zgenom load Freed-Wu/zsh-command-not-found

  # Jump to directories more quickly.
  zgenom eval --name zoxide <<(zoxide init zsh --cmd cd)

  # Better search for shell history.
  zgenom eval --name atuin <<(atuin init zsh)

  # Docker aliases
  zgenom load akarzim/zsh-docker-aliases

  # Custom aliases
  zgenom load $ZDOTDIR/aliases

  # Prompt theme
  zgenom load $ZDOTDIR/theme
  zgenom eval --name starship <<(starship init zsh)

  # Key bindings
  zgenom load $ZDOTDIR/bindings.zsh

  # Compile everything
  zgenom compile $ZDOTDIR

  zgenom save
fi

# Show system info at launch
macchina
