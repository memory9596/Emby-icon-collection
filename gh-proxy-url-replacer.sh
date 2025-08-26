#!/bin/sh

ICON_SRC_URL="$1"
ICON_PATH="release/$2"
mkdir -p "$(dirname "$ICON_PATH")"
curl -sL --fail "$ICON_SRC_URL" | \
    sed -E \
    -e 's|https://raw.githubusercontent.com/([^/]+)/([^/]+)(/refs/heads)?/([^/]+)/(.*)|https://testingcf.jsdelivr.net/gh/\1/\2@\4/\5|g' \
    -e 's|https:\\/\\/raw.githubusercontent.com\\/([^/]+)\\/([^/]+)\\/([^/]+)\\/([^/]+)\\/(.*)|https://testingcf.jsdelivr.net/gh/\1/\2@\3/\4/\5|g' \
    > "$ICON_PATH"
sed -i ':a;N;$!ba;s/,\n\(\s*\)]/\n\1]/g' "$ICON_PATH"
