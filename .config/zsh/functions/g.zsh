# no arguments: git status
# with arguments: acts like 'git'
g() {
	if [[ $# -gt 0 ]]; then
		git "$@"
	else
		git status
	fi
}
