#!/usr/bin/env zsh

main() {
	setopt null_glob
	local _debug=false

	local dirs=($HOME/.config/zsh/configs/pre $HOME/.config/zsh/configs $HOME/.config/zsh/configs/post $HOME/.config/zsh/functions $HOME/.config/zsh/aliases $HOME/.config/zsh/prompts)

	for dir in "${dirs[@]}"; do
		if [[ -d "$dir" ]]; then
			for f in $dir/*.zsh(.on); do
				[[ "$_debug" == true ]] && echo "Sourcing file $f ..."
				source "$f"
			done
		fi
	done
}

main

