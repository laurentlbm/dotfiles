(( $+commands[paru] ))  && autoload -Uz pacf
(( $+commands[pkg] ))   && autoload -Uz pkgf
(( $+commands[rg] ))    && autoload -Uz rgf

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
alias mkdir='mkdir -p'
alias x='exit'
alias yt='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4"'
alias g='git'
alias lzg='lazygit'
# disable ssh compression for improved rsync speeds
alias rsync='rsync -haP --numeric-ids -e "ssh -o Compression=no"'
alias sc='sudo systemctl'
alias ypull='yadm pull; yadm submodule update --init --recursive --force --remote'
(( $+commands[codium] )) && alias code=codium
(( $+commands[batman] )) && alias man=batman
