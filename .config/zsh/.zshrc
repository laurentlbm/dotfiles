# Personal Zsh configuration file. It is strongly recommended to keep all
# shell customization and configuration (including exported environment
# variables such as PATH) in this file or in files source by it.
#
# Documentation: https://github.com/romkatv/zsh4humans/blob/v5/README.md.

# Periodic auto-update on Zsh startup: 'ask' or 'no'.
# You can manually run `z4h update` to update everything.
zstyle ':z4h:' auto-update      'ask'
# Ask whether to auto-update this often; has no effect if auto-update is 'no'.
zstyle ':z4h:' auto-update-days '28'

# Automaticaly wrap TTY with a transparent tmux ('integrated'), or start a
# full-fledged tmux ('system'), or disable features that require tmux ('no').
zstyle ':z4h:' start-tmux       'system'

# Move prompt to the bottom when zsh starts up so that it's always in the
# same position. Has no effect if start-tmux is 'no'.
zstyle ':z4h:' prompt-at-bottom 'yes'

# Keyboard type: 'mac' or 'pc'.
zstyle ':z4h:bindkey' keyboard  'pc'

# Mark up shell's output with semantic information.
zstyle ':z4h:' term-shell-integration 'yes'

# Right-arrow key accepts one character ('partial-accept') from
# command autosuggestions or the whole thing ('accept')?
zstyle ':z4h:autosuggestions' forward-char 'accept'

# Recursively traverse directories when TAB-completing files.
zstyle ':z4h:fzf-complete' recurse-dirs 'yes'
zstyle ':z4h:fzf-complete' fzf-bindings tab:repeat

# disable override of ssh
zstyle ':z4h:ssh:*' ssh-command command ssh

# Clone additional Git repositories from GitHub.
#
# This doesn't do anything apart from cloning the repository and keeping it
# up-to-date. Cloned files can be used after `z4h init`.
(( $+commands[docker] )) && z4h install akarzim/zsh-docker-aliases
z4h install ohmyzsh/ohmyzsh || return
z4h install wfxr/forgit || return

# Install or update core components (fzf, zsh-autosuggestions, etc.) and
# initialize Zsh. After this point console I/O is unavailable until Zsh
# is fully initialized. Everything that requires user interaction or can
# perform network I/O must be done above. Everything else is best done below.

# Configure paths to minimize files at the root of home
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"

export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"

export GOPATH="${XDG_DATA_HOME}/go"

export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"

export TERMINFO="${XDG_DATA_HOME}/terminfo"
export TERMINFO_DIRS="${XDG_DATA_HOME}/terminfo:/usr/share/terminfo"

export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/config"
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME}/npm"
export NPM_CONFIG_PREFIX="${XDG_DATA_HOME}/npm"

zsh_functions="${XDG_DATA_HOME}/zsh/functions"

# Extend PATH.
path=(
  "${NPM_CONFIG_PREFIX}/bin"
  $path
  "${GOPATH}/bin"
  "${CARGO_HOME}/bin"
  "/opt/cuda/bin"
)
[[ -n $TERMUX_VERSION ]] && path=($path "${HOME}/.termux/bin")

fpath=("${zsh_functions}" $fpath "${XDG_DATA_HOME}/zsh/completions")

z4h init || return

# Export environment variables.
export GPG_TTY=$TTY
export VISUAL="micro"
export EDITOR="$VISUAL"
export COLORTERM="truecolor"
export MICRO_TRUECOLOR=1

(( $+commands[bat] )) && {
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  export MANROFFOPT="-c"

  [[ -n $TERMUX_VERSION ]] && export MANPAGER="mandoc-bat-pager"
}

# Configure fzf preview differently on mpbile
local columns=$(tmux display-message -p "#{window_width}" || tput cols)
if [ $columns -lt 100 ]; then
  export FZF_DEFAULT_PREVIEW_WINDOW_OPTS="down:70%:wrap"
else
  export FZF_DEFAULT_PREVIEW_WINDOW_OPTS="right:70%:wrap"
fi

# fzf dracula theme
export FZF_DEFAULT_OPTS="
--color=dark
--color=fg:-1,bg:-1,hl:#8aff80,fg+:-1,bg+:-1,hl+:#ffca80
--color=info:#9580ff,prompt:#8aff80,pointer:#ff80bf,marker:#ff80bf,spinner:#ff80bf
--preview-window='$FZF_DEFAULT_PREVIEW_WINDOW_OPTS'
"

# Use additional Git repositories pulled in with `z4h install`.
(( $+commands[docker] )) && z4h source $Z4H/akarzim/zsh-docker-aliases/alias.zsh
z4h source $Z4H/ohmyzsh/ohmyzsh/lib/git.zsh
z4h source $Z4H/ohmyzsh/ohmyzsh/plugins/git/git.plugin.zsh
z4h source $Z4H/ohmyzsh/ohmyzsh/plugins/sudo/sudo.plugin.zsh
z4h source $Z4H/ohmyzsh/ohmyzsh/plugins/aliases/aliases.plugin.zsh
z4h source $Z4H/wfxr/forgit/forgit.plugin.zsh


# Define key bindings.
z4h bindkey z4h-backward-kill-word  Ctrl+Backspace Ctrl+H
z4h bindkey z4h-backward-kill-zword Ctrl+Alt+Backspace

z4h bindkey undo Ctrl+/  # undo the last command line change
z4h bindkey redo Alt+/   # redo the last undone command line change

z4h bindkey z4h-cd-back    Alt+Left   # cd into the previous directory
z4h bindkey z4h-cd-forward Alt+Right  # cd into the next directory
z4h bindkey z4h-cd-up      Alt+Up     # cd into the parent directory
z4h bindkey z4h-cd-down    Alt+Down   # cd into a child directory

autoload edit-command-line; zle -N edit-command-line
z4h bindkey edit-command-line Ctrl+E # edit command line in $EDITOR

# Autoload functions.
autoload -Uz zmv
autoload -Uz $zsh_functions/*(:t)

# Define functions and completions.
(( $+commands[zoxide] )) && eval "$(zoxide init zsh --cmd cd)"

(( $+commands[thefuck] )) && eval "$(thefuck --alias fu)"

# Define named directories: ~w <=> Windows home directory on WSL.
[[ -n $z4h_win_home ]] && hash -d w=$z4h_win_home

# Define aliases.
alias m='micro'
alias vi='lvim'
alias ls='exa --all --icons --group-directories-first'
alias ll='ls --long --git'
alias tree='ls --tree --ignore-glob=.git'
alias mv='mv -i'
alias x='exit'
alias yt='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4"'
alias g='git'
alias lzg='lazygit'
# `--no-inc-recursive` checks all the files, so it is a bit slower to start
alias cpr='rsync --archive --human-readable --partial --info=progress2 --no-inc-recursive --modify-window=1'
alias mvr='cpr --remove-source-files'
alias sc='sudo systemctl'

(( $+commands[codium] )) && alias code=codium

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots     # no special treatment for file names with a leading dot
setopt no_auto_menu  # require an extra TAB press to open the completion menu

(( $+commands[fastfetch] )) && {
  local config=$(yadm config local.os)
  fastfetch --load-config "${config:-$(lsb_release -si)}"
  echo ''
}
