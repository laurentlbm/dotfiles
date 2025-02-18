# Always run in tmux
[[ -z "$NO_TMUX" ]] && [[ -z "$TMUX" ]] && (( $+commands[tmux] )) && {
  tmux new -A -s main
  exit
}

# Use zgenom to manage plugins
ZGEN_SOURCE="${XDG_CACHE_HOME}/zgenom"
if [ ! -e "${ZGEN_SOURCE}/zgenom.zsh" ]; then
  git clone https://github.com/jandamm/zgenom.git "$ZGEN_SOURCE"
fi
source $ZGEN_SOURCE/zgenom.zsh

# Update zgenom and plugins every 7 days
zgenom autoupdate

if ! zgenom saved
then
  zgenom compdef

  # zgenom extension
  zgenom load jandamm/zgenom-ext-eval

  # Shell config I didn't know where else to put...
  zgenom load $ZDOTDIR/base.zsh

  # Load ohmyzsh plugins
  zgenom ohmyzsh
  # git aliases
  zgenom ohmyzsh plugins/git
  # prefix command with sudo with <ESC><ESC>
  zgenom ohmyzsh plugins/sudo
  # direnv integration
  (( $+commands[direnv] )) && zgenom ohmyzsh plugins/direnv
  # Use the command-not-found package for zsh to provide suggested packages to be installed if a command cannot be found
  zgenom ohmyzsh plugins/command-not-found
  # History with UP & DOWN
  zgenom ohmyzsh plugins/history-substring-search

  # Add tons of completion definitions.
  zgenom load clarketm/zsh-completions

  # Use fzf for tab completions.
  zgenom load Aloxaf/fzf-tab

  # Syntax highlighting
  zgenom load zsh-users/zsh-syntax-highlighting

  # Fish-like fast/unobtrusive autosuggestions for zsh.
  zgenom load zsh-users/zsh-autosuggestions

  # Auto-close and delete matching delimiters.
  zgenom load hlissner/zsh-autopair

  # Jump to directories more quickly.
  (( $+commands[zoxide] )) && zgenom eval --name zoxide <<(zoxide init zsh --cmd cd)

  # Better search for shell history.
  (( $+commands[atuin] )) && zgenom eval --name atuin <<(atuin init zsh --disable-up-arrow)

  # Custom aliases
  zgenom load $ZDOTDIR/aliases

  # Prompt theme
  zgenom load $ZDOTDIR/theme
  (( $+commands[starship] )) && zgenom eval --name starship <<(starship init zsh)

  # Key bindings
  zgenom load $ZDOTDIR/bindings.zsh

  # Configure built-in completion system.
  zgenom load $ZDOTDIR/completion.zsh

  # Compile everything
  zgenom compile $ZDOTDIR

  zgenom save
fi

# Show system info at launch
(( $+commands[fastfetch] )) && fastfetch
