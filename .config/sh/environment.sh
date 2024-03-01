# Load all environment variables, if needed (done by systemd on Linux)
if [ -z "$ENVIRONMENTD_LOADED" ]; then
  set -o allexport # export all variables created next
  for f in $HOME/.config/environment.d/*.conf; do
    . "$f"
  done
  set +o allexport
fi
