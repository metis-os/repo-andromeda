#!/usr/bin/env bash

## Copyright (C) 2020-2022 Metis Linux <info@metislinux.org>
## Everyone is permitted to copy and distribute copies of this file under GNU-GPL3

# Variables
PKGDIR="${HOME}/metis-repo/x86_64"

cleanup() {
  cd "$PKGDIR" || exit
  rm -rf metis.db* metis.files*
  cd ..
  echo -e "[*] Repo cleaned successfully [*]"
}

gitadd() {
  git add --all
  read -rp "Enter commit message: " commitmsg
  git commit -m "$commitmsg"
  git push --force
  echo -e "[*] Added all pkgs to Repo [*]\n"
}

updaterepo() {
  cd "$PKGDIR" || exit
  repo-add -n -R metis.db.tar.gz *.pkg.tar.zst*
  cd ..
  echo -e "[*] Repo updated successfully [*]"
  echo -e "\n"
}

usage() {
  cat <<-EOF
    Usage: $(basename "$0") [-c] [-u] [-g] [-h]

    Options:
      -c    Clean current repo
      -u    Update Repo
      -g    Add files to GitHub repo
      -h    Show this help message

    To add Metis repo, first create a zst archive of the file and use the options -c -u -g respectively to add it to the repository.
EOF
}

# Get the directory of the script
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Move to the script directory
cd "$SCRIPT_DIR" || exit

# Parse command-line options
while getopts 'cugh' option; do
  case "$option" in
    c)
      cleanup ;;
    u)
      updaterepo ;;
    g)
      gitadd ;;
    h | *)
      usage ;;
  esac
done

