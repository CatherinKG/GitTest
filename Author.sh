#!/bin/sh

git filter-branch --env-filter '

OLD_NAME="CATHERINE"
CORRECT_NAME="CATHY555"
EMAIL="catherine.kg@cabotsolutions.com"

if [ "$GIT_COMMITTER_EMAIL" = "$EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
fi
' --tag-name-filter cat -- --branches --tags
