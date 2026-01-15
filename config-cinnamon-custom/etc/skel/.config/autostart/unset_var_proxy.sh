#!/usr/bin/env bash

unset_var_proxy() {
	# List of variables to check
	vars=("all_proxy" "auto_proxy" "ftp_proxy" "http_proxy" "https_proxy" "no_proxy")

	# Initialize a string to store the variables to be unset
	unset_vars=""

	# Loop to check each variable
	for var in "${vars[@]}"; do
		# Check if the variable is empty
		if [ -z "${!var}" ]; then
			# Add the variable to the list of variables to be unset
			unset_vars+=" $var"
		fi
	done

	# Check if there are any variables to be unset
	if [ -n "$unset_vars" ]; then
		# Execute the unset command for the empty variables
		unset $unset_vars
	fi
}
export -f unset_var_proxy

unset_var_proxy
