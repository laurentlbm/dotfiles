if _command_exists lsd; then
  alias ls='lsd'
  alias tree='ls --tree'
fi

mkcd ()
{
  mkdir -p -- "$1" &&
     cd -P -- "$1"
}

alias mkdir='mkdir -p'
alias ..='cd ..'
alias ....='cd ../..'

# Define aliases.
alias sudo='sudo ' # https://wiki.archlinux.org/title/Sudo#Passing_aliases
alias m='micro'
( _command_exists nvim ) && alias vi='nvim'
( _command_exists lvim ) && alias vi='lvim'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias l='ls -lah'
alias x='exit'
alias yt='yt-dlp -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4"'
alias g='git'
alias lzg='lazygit'
# disable compression for improved rsync speeds
alias rsync='rsync -s -avAXEWSHh --no-compress --info=progress2'
alias sc='sudo systemctl'
alias ypull='yadm pull; yadm submodule update --init --recursive --force --remote'
alias ylzg='lzg -w ~ -g ~/.local/share/yadm/repo.git'
( _command_exists codium ) && alias code=codium
( _command_exists batman ) && alias man=batman
( _command_exists pacdiff && _command_exists meld ) && alias pacdiff='sudo -H DIFFPROG=meld pacdiff'

alias sysyadm='sudo yadm --yadm-dir /etc/yadm --yadm-data /etc/yadm/data'
