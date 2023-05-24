#!/usr/bin/env bash

## Copyright (C) 2022-present Metis Linux  || Pwnwriter <info@metislinux.org>
## Everyone is permitted to copy and distribute copies of this file under MIT License

# DIRS

repo=andromeda
PKGDIR="$(pwd)/${repo}/os/x86_64/"


cleanup() {
    cd "$PKGDIR" || { echo "Error: Unable to navigate to $PKGDIR"; exit 1; }
    rm -rf andromeda.db* andromeda.files*
    cd ../ || { echo "Error: Unable to navigate back from $PKGDIR"; exit 1; }
    echo -e "[*] Repo cleaned successfully [*]"
}

gitadd() {
    git add --all || { echo "Error: Failed to add files to Git"; exit 1; }
    read -p "Enter commit message: " commitmsg 
    git commit -m "$commitmsg" || { echo "Error: Failed to commit changes"; exit 1; }
    git push --force || { echo "Error: Failed to push changes"; exit 1; }
    echo -e "[*] Added all packages to the repository [*]\n"
}

updaterepo() {
    cd "$PKGDIR" || { echo "Error: Unable to navigate to $PKGDIR"; exit 1; }
    repo-add -n -R andromeda.db.tar.gz *.pkg.tar.zst* || { echo "Error: Failed to update repository"; exit 1; }
    cd ../ || { echo "Error: Unable to navigate back from $PKGDIR"; exit 1; }
    echo -e "[*] Repo updated successfully [*]"
    echo -e "\n"
}

usages() {
    cat <<- EOF
    Usage: $(basename "$0") [-c] [-u] [-g]
    Options:
        -h    Show this help message
        -u    Update Repo
        -g    Add files to GitHub repo
        -c    Clean current repo

To add Metis repo, first create a zst archive of the file and use -c -u -g respectively to add it to the repository.
EOF
}

# Getopts implementation for arguments

if [[ $# -eq 0 ]]; then
    usages
    exit 1
fi

while getopts 'cugh' option; do
    case "$option" in
    c)
        cleanup ;;
    u)
        updaterepo ;;
    g)
        gitadd ;;
    h)
        usages ;;
    ?)
        exit 1 ;;
    esac
done

