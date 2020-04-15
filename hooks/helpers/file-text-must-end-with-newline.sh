#!/bin/sh
set -euf
exit_code=0

# Get a file's media type type a.k.a. mime type such as "text"
media_type_type() { file --brief --mime "$1" | sed 's#/.*##' ; }

# File ends with newline?
file_ends_with_newline() { test $(tail -c1 "$1" | wc -l) -gt 0 ; }

for file_name in $(git diff --cached --name-only); do
	if [ $(media_type_type "$file_name") = "text" ] && [ ! $(file_ends_with_newline "$file_name") ]; then
		exit_code=1
		printf %s\\n "File \`$file_name\` text must end with newline."
	fi
done

exit $exit_code
