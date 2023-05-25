#!/usr/bin/env bash
if [[ "$1" == "--help" ]]; then
  echo "Usage: git-sync-file <repo-url> <file> [path-in-repo=file] [delay=1m]"
  echo ""
  exit 0
fi

# Get arguments
repo="$1"
file="$2"
dest="$3"
delay="$4"

# Use defaults
if [ -z "$dest" ];  then dest="$file"; fi
if [ -z "$delay" ]; then delay="1m";   fi

# Clone repository to /tmp
path="$(mktemp -d)"
git clone "$repo" "$path"

# Repeatedly amend commit and push
while true; do
  echo "Syncing file ..."
  cp "$file" "$path/$dest"
  cd "$path"
  git add "$dest"
  git commit --amend --no-edit --allow-empty-message
  git push -f
  cd - > /dev/null
  echo ""
  sleep "$delay"
done
