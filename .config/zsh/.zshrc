# Personal Zsh configuration file.
#
# Documentation: https://github.com/romkatv/zsh4humans/blob/v5/README.md.

zstyle ':z4h:'                auto-update            ask
zstyle ':z4h:'                auto-update-days       28
zstyle ':z4h:'                start-tmux             system
zstyle ':z4h:'                prompt-at-bottom       no
zstyle ':z4h:bindkey'         keyboard               pc
zstyle ':z4h:'                term-shell-integration yes
zstyle ':z4h:autosuggestions' forward-char           accept
zstyle ':z4h:fzf-complete'    recurse-dirs           yes
zstyle ':z4h:fzf-complete'    fzf-bindings           tab:repeat
zstyle ':z4h:ssh:*'           enable                 no
zstyle ':z4h:ssh:*'           ssh-command            command ssh

# Clone additional Git repositories from GitHub.
(( $+commands[docker] )) && z4h install akarzim/zsh-docker-aliases
z4h install ohmyzsh/ohmyzsh wfxr/forgit
(( $+commands[pacman] )) && z4h install pkasemir/find-the-command

# Configure paths
[[ ! -z ENVIRONMENTD_LOADED ]] && {
  # export environment variables (done by systemd on Linux)
  set -o allexport # export all variables created next
  z4h source ${HOME}/.config/environment.d/*.conf
  set +o allexport
}

[[ -n $TERMUX_VERSION ]] && path=($path "${HOME}/.termux/bin")

# Initialize zsh4humans
z4h init || return

zsh_functions="${XDG_DATA_HOME}/zsh/functions"
fpath=("${zsh_functions}" $fpath "${XDG_DATA_HOME}/zsh/completions")

autoload -Uz -- zmv $zsh_functions/*(N:t)

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
(( $+commands[pacman] )) && z4h source --compile $Z4H/pkasemir/find-the-command/usr/share/doc/find-the-command/ftc.zsh

# Define key bindings.
z4h bindkey undo Ctrl+Z  # undo the last command line change
z4h bindkey redo Ctrl+Y  # redo the last undone command line change

# Helps z4h transient prompt function consistently over ssh
z4h bindkey z4h-eof Ctrl+D
setopt ignore_eof
POSTEDIT=$'\n\n\e[2A'

# edit command line in $EDITOR
autoload edit-command-line; zle -N edit-command-line
z4h bindkey edit-command-line Ctrl+E

# Define named directories: ~w <=> Windows home directory on WSL.
[[ -n $z4h_win_home ]] && hash -d w=$z4h_win_home

# Configure tools
(( $+commands[atuin] )) && {
  export ATUIN_NOBIND="true"
  source <(atuin init zsh)
  z4h bindkey _atuin_search_widget Ctrl+R
}

(( $+commands[zoxide] )) && source <(zoxide init zsh --cmd cd)

(( $+commands[thefuck] )) && source <(thefuck --alias fu)

(( $+commands[exa] )) && {
  alias ls='exa --all --git --icons --group-directories-first --time-style=long-iso --color-scale --classify'
  alias ll='ls --long'
  alias tree='ls --tree --ignore-glob=.git'
}

# Define aliases.
alias sudo='sudo ' # https://wiki.archlinux.org/title/Sudo#Passing_aliases
alias m='micro'
(( $+commands[nvim] )) && alias vi='nvim'
(( $+commands[lvim] )) && alias vi='lvim'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias x='exit'
alias yt='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4"'
alias g='git'
alias lzg='lazygit'
# disable ssh compression for improved rsync speeds
alias rsync='rsync -haP --numeric-ids -e "ssh -o Compression=no"'
alias sc='sudo systemctl'
alias ypull='yadm pull; yadm submodule update --init --recursive --force --remote'
(( $+commands[codium] )) && alias code=codium

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots     # no special treatment for file names with a leading dot
setopt no_auto_menu  # require an extra TAB press to open the completion menu

(( $+commands[macchina] )) && {
  macchina --config "${XDG_CONFIG_HOME}/macchina/$(hostname).toml"
}
