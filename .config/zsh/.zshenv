# Load all environment variables, if needed (done by systemd on Linux)
[[ -z "$ENVIRONMENTD_LOADED" ]] && {
  set -o allexport # export all variables created next
  for f in $HOME/.config/environment.d/*.conf; do
    source "$f"
  done
  set +o allexport
}

fpath=(
  "${XDG_DATA_HOME}/zsh/functions"
  $fpath
)
