#!/bin/sh -e

# Set the following variables
# - GITHUB_LOGIN_NAME: an user name of GitHub
# - GITHUB_TOKEN: an access token, which has access scopes to fetch private and public repositories
# - GITHUB_BASE_DIR: a directory to clone repositories

if [ -z "$GITHUB_LOGIN_NAME" ]; then
  echo >&2 GITHUB_LOGIN_NAME is not set
  exit 1
fi

if [ -z "$GITHUB_TOKEN" ]; then
  echo >&2 GITHUB_TOKEN is not set
  exit 1
fi

if [ -z "$GITHUB_BASE_DIR" ]; then
  echo >&2 GITHUB_BASE_DIR is not set
  exit 1
fi


curl -sS -u "${GITHUB_LOGIN_NAME}:${GITHUB_TOKEN}" -L 'https://api.github.com/user/repos?per_page=1000' |\
  jq -r '.[].full_name' |\
  while read -r repository; do
    repository_directory="${GITHUB_BASE_DIR}/${repository}"
    remote_url="https://${GITHUB_LOGIN_NAME}:${GITHUB_TOKEN}@github.com/${repository}"

    if [ -d "${repository_directory}/.git" ]; then
      ( cd "$repository_directory"
        git remote update )
    else
      git clone "$remote_url" "$repository_directory"
    fi
  done
