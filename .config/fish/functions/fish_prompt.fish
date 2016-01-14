function fish_prompt --description 'Write out the prompt'

	# Store previous status
	set -l last_status $status

	##
	# Colors
	#

	set -l color_pwd          blue
	set -l color_screen_info  magenta
	set -l color_prompt_err   red
	set -l color_prompt_ok    999

	##
	# Screen status
	#

	set -l screen_info

	if [ $STY ]
		# Show the screen's name if inside
		set screen_info \
			(set_color normal) "[" \
			(set_color $color_screen_info) $STY \
			(set_color normal) "] "
	else
		# Show the number of detached screens if outside
		set -l num_detached_screens (screen -ls | grep -E '^\t[0-9]+\..*\(Detached\)$' | wc -l | tr -d " ")

		if [ $num_detached_screens -gt 0 ]
			set screen_info \
				(set_color normal) "[" \
				(set_color $color_screen_info) $num_detached_screens \
				(set_color normal) "] "
		end
	end

	##
	# Prompt arrow color based on last exit code
	#

	set -l prompt_arrow_color

	if [ $last_status -eq 0 ]
		set prompt_arrow_color $color_prompt_ok
	else
		set prompt_arrow_color $color_prompt_err
	end

	##
	# Prompt output
	#

	echo -n -s ' ' \
		$screen_info \
		(set_color $color_pwd) (prompt_pwd) (set_color normal) \
		(__fish_git_prompt) \
		" " (set_color $prompt_arrow_color) "❯" (set_color normal) " "
end
