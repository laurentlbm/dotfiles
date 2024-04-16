0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"
ZSH_THEME_DIR="${0:A:h}"

source "$ZSH_THEME_DIR/docker.zsh"

(( $+commands[paru] ))  && autoload -Uz pacf parm
(( $+commands[pkg] ))   && autoload -Uz pkgf
(( $+commands[apt] ))   && autoload -Uz aptf
(( $+commands[rg] ))    && autoload -Uz rgf

(( $+commands[lsd] )) && {
  alias ls='lsd'
  alias tree='ls --tree'
}

function mkd() { mkdir -p $@ && cd ${@:$#} }
alias mkdir='mkdir -p'
alias ..='cd ..'
alias ....='cd ../..'

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
# disable compression for improved rsync speeds
alias rsync='rsync -s -avAXEWSHh --no-compress --info=progress2'
alias sc='sudo systemctl'
alias ypull='yadm pull; yadm submodule update --init --recursive --force --remote'
alias ylzg='lzg -w ~ -g ~/.local/share/yadm/repo.git'
(( $+commands[codium] )) && alias code=codium
(( $+commands[batman] )) && alias man=batman
(( $+commands[pacdiff] && $+commands[meld] )) && alias pacdiff='sudo -H DIFFPROG=meld pacdiff'

alias sysyadm='sudo yadm --yadm-dir /etc/yadm --yadm-data /etc/yadm/data'
