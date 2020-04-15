#!/bin/sh
set -euf
exit_code=0

for x in $(git diff --cached --name-only | grep '\.env$'); do
	if [ $exit_code -eq 0 ]; then
		exit_code=1
		printf %s\\n 'Error: file name must not end with `.env`.'
	fi
	printf %s\\n "File: $x"
done

exit $exit_code
