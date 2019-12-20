#!/bin/sh

REPO_NAME=$1
git clone --bare "https://github.com/Bmillidgework/${REPO_NAME}"
cd $REPO_NAME


git filter-branch --env-filter '

OLD_EMAIL="<old-email>"
CORRECT_NAME="<correct-name"
CORRECT_EMAIL="<correct-email>"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags

git push --force --tags origin 'refs/heads/*'
cd ..
rm -rf $REPO_NAME
