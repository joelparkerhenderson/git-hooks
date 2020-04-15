# Git hooks

This repo has example git hooks and helpers.

For example our git hook named `pre-commit` runs all our scripts in our directory `pre-commit.d`.

For example our git hook `precommit.d/file-name-must-not-end-with-env.sh` helps protect from accidentially committing a environment variable settings file.

The git hook prints messages such as:

```sh
Error: file name must not end with `.env`
File: .env
File: production.env
File: development.env
```

The git hook source code is shell script:
```sh
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
```
