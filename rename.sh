#!/bin/sh

# New author details
NEW_NAME="toxinu"
NEW_EMAIL="toxinu@gmail.com"

# Use git filter-branch to update all commits
git filter-branch --env-filter "
if [ -n \"\$GIT_COMMITTER_NAME\" ]; then
    export GIT_COMMITTER_NAME=\"$NEW_NAME\"
    export GIT_COMMITTER_EMAIL=\"$NEW_EMAIL\"
fi
if [ -n \"\$GIT_AUTHOR_NAME\" ]; then
    export GIT_AUTHOR_NAME=\"$NEW_NAME\"
    export GIT_AUTHOR_EMAIL=\"$NEW_EMAIL\"
fi
" --tag-name-filter cat -- --branches --tags

# Optional: Clean up backup refs created by filter-branch
rm -rf .git/refs/original/
