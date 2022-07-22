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

[[ -n $TERMUX_VERSION ]] && {
  # import environment variables (done by systemd on Linux)
  z4h source ${HOME}/.config/environment.d/*.conf

  path=($path "${HOME}/.termux/bin")
}

zsh_functions="${XDG_DATA_HOME}/zsh/functions"
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

# Use additional Git repositories pulled in with `z4h install`.
(( $+commands[docker] )) && z4h source --compile $Z4H/akarzim/zsh-docker-aliases/alias.zsh
z4h source --compile $Z4H/ohmyzsh/ohmyzsh/lib/git.zsh
z4h source --compile $Z4H/ohmyzsh/ohmyzsh/plugins/git/git.plugin.zsh
z4h source --compile $Z4H/ohmyzsh/ohmyzsh/plugins/sudo/sudo.plugin.zsh
z4h source --compile $Z4H/ohmyzsh/ohmyzsh/plugins/aliases/aliases.plugin.zsh
z4h source --compile $Z4H/wfxr/forgit/forgit.plugin.zsh


# Define key bindings.
z4h bindkey undo Ctrl+Z  # undo the last command line change
z4h bindkey redo Ctrl+Y  # redo the last undone command line change

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
alias vi='nvim'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias x='exit'
alias yt='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4"'
alias g='git'
alias lzg='lazygit'
# `--no-inc-recursive` checks all the files, so it is a bit slower to start
alias cpr='rsync --archive --human-readable --partial --info=progress2 --no-inc-recursive --modify-window=1'
alias mvr='cpr --remove-source-files'
alias sc='sudo systemctl'

(( $+commands[exa] )) && {
  export TIME_STYLE='long-iso'
  alias ls='exa --all --git --icons --group-directories-first --color-scale --classify'
  alias ll='ls --long'
  alias tree='ls --tree --ignore-glob=.git'
}

(( $+commands[codium] )) && alias code=codium

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots     # no special treatment for file names with a leading dot
setopt no_auto_menu  # require an extra TAB press to open the completion menu

(( $+commands[fastfetch] )) && {
  local config=$(yadm config local.os)
  config="${config:-$(lsb_release -si)}"
  fastfetch --load-config "${config}"
  echo ''
}
