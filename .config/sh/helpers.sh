function _command_exists() {
	if type -t "$1" > /dev/null; then
		return 0
	else
		return 1
	fi
}
