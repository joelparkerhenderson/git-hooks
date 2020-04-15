# Git hooks

This repo has example git hooks and helpers.

For example our git hook named `pre-commit` runs these:

```sh
.git/hooks/helpers/file-name-must-not-start-with "tmp"
.git/hooks/helpers/file-name-must-not-end-with ".env"
.git/hooks/helpers/file-name-must-not-contain "unversioned"
.git/hooks/helpers/file-text-must-end-with-newline
```

Then runs any scripts in the corresponding directory:

```sh
.git/hooks/pre-commit.d
```

The git hooks print messages such as:

```sh
File `tmp/example.txt` name must not start with `tmp`
File `environments/example.env` name must not end with `.env`
File `vendor/unversioned/example.bin` name must not contain "unversioned"
File `doc/example.txt` text must end with newline
```

The git hooks can use any language, such as this example using POSIX shell:

```sh
#!/bin/sh
set -euf
target="$1"
exit_code=0

for file_name in $(git diff --cached --name-only); do
    case "$file_name"
        "$target"*)
            exit_code=1
            printf %s\\n "File \`$file_name\` name must not start with \`$target\`."
        ;;
    esac
done

exit $exit_code
```
