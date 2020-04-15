
#!/bin/sh
set -euf
target="$1"
exit_code=0

for file_name in $(git diff --cached --name-only); do
    case "$file_name"
        *"$target"*)
            exit_code=1
            printf %s\\n "File \`$file_name\` name must not contain \`$target\`."
        ;;
    esac
done

exit $exit_code
