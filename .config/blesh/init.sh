bleopt filename_ls_colors="$LS_COLORS"

bind 'set completion-ignore-case on'

# enter a few characters and press UpArrow/DownArrow
# to search backwards/forwards through the history
if [[ ${SHELLOPTS} =~ (vi|emacs) ]]; then
	bind '"\e[A":history-substring-search-backward'
	bind '"\e[B":history-substring-search-forward'
fi
