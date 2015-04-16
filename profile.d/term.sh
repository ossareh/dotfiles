PS1='[\u@\h \W]\$ '
PS2='> '
PS3='> '
PS4='+ '

# colorize terminal if supported
case ${TERM} in
    xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
	PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
	;;
esac

