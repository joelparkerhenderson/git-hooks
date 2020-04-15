#!/bin/sh
set -euf
exit_code=0

# Get a file's media type type a.k.a. mime type such as "text"
media_type_type() { file --brief --mime "$1" | sed 's#/.*##' ; }

# File ends with newline?
file_ends_with_newline() { test $(tail -c1 "$1" | wc -l) -gt 0 ; }

for x in $(git diff --cached --name-only); do
	if [ $(media_type_type "$x") = "text" ] && [ ! $(file_ends_with_newline "$x") ]; then
		if [ $exit_code -eq 0 ]; then
			exit_code=1
			printf %s\\n "Error: file text must end with newline."
		fi
		printf %s\\n "File: $x"
	fi
done

exit $exit_code
