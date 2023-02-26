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
zgenom autoupdate

if ! zgenom saved
then
  zgenom compdef

  # zgenom extension
  zgenom load jandamm/zgenom-ext-eval

  # Theme (load early because some plugins use colors set by the theme)
  zgenom load $ZDOTDIR/catppuccin

  zgenom load $ZDOTDIR/defaults.zsh

  # Zephyr plugins
  zgenom load mattmc3/zephyr plugins/history
  zgenom load mattmc3/zephyr plugins/utility

  # Ohmyzsh plugins
  zgenom ohmyzsh
  zgenom ohmyzsh plugins/docker
  zgenom ohmyzsh plugins/docker-compose
  zgenom ohmyzsh plugins/git
  zgenom ohmyzsh plugins/sudo

  # Completions
  zgenom load zap-zsh/completions
  zgenom load clarketm/zsh-completions

  # Prompt helpers
  zgenom load zsh-users/zsh-syntax-highlighting
  zgenom load zsh-users/zsh-autosuggestions
  zgenom load hlissner/zsh-autopair
  zgenom load Aloxaf/fzf-tab
  zgenom load Freed-Wu/zsh-command-not-found

  # Jump to directories more quickly
  zgenom eval --name zoxide <<(zoxide init zsh --cmd cd)

  # Better search for shell history
  zgenom eval --name atuin <<(atuin init zsh)

  # Prompt theme
  zgenom eval --name starship <<(starship init zsh)

  # Aliases
  zgenom load $ZDOTDIR/aliases

  # Key bindings
  zgenom load $ZDOTDIR/bindings.zsh

  # Compile everything
  zgenom compile $ZDOTDIR

  zgenom save
fi

# Show system info at launch
macchina
