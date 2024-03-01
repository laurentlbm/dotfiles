. .config/sh/environment.sh

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

. .config/sh/helpers.sh
. .config/sh/ls-colors.sh
. .config/sh/theme.sh
. .config/sh/aliases.sh

. ~/.local/share/blesh/ble.sh

# Jump to directories more quickly.
_command_exists zoxide && eval "$(zoxide init bash)"

# Better search for shell history.
_command_exists atuin && eval "$(atuin init bash --disable-up-arrow)"

# Prompt theme
_command_exists starship && eval "$(starship init bash)"
