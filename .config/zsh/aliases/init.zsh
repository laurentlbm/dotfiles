(( $+commands[paru] ))  && autoload -Uz pacf
(( $+commands[pkg] ))   && autoload -Uz pkgf
(( $+commands[rg] ))    && autoload -Uz rgf

(( $+commands[lsd] )) && {
  alias ls='lsd'
  alias tree='ls --tree'
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
# disable compression for improved rsync speeds
alias rsync='rsync -s -avAXEWSHh --no-compress --info=progress2'
alias sc='sudo systemctl'
alias ypull='yadm pull; yadm submodule update --init --recursive --force --remote'
alias ylzg='lzg -w ~ -g ~/.local/share/yadm/repo.git'
(( $+commands[codium] )) && alias code=codium
(( $+commands[batman] )) && alias man=batman
(( $+commands[pacdiff] && $+commands[meld] )) && alias pacdiff='sudo -H DIFFPROG=meld pacdiff'

alias sysyadm='sudo yadm --yadm-dir /etc/yadm --yadm-data /etc/yadm/data'
