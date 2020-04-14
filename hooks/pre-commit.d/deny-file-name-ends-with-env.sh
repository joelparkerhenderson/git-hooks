#!/bin/sh
set -euf
if git diff --cached --name-only | grep '\.env$' > /dev/null; then
	cat <<\EOF
Error: Attempt to use a file name that ends with `.env`.
These kinds of files may cause problems in git repositories because 
they may contain environment variables such as passwords and keys.
EOF
	exit 1
fi
