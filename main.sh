#!/usr/bin/env bash

## Copyright (C) 2020-2022 Metis Linux <info@metislinux.org>
## Everyone is permitted to copy and distribute copies of this file under GNU-GPL3

# DIRS
PKGDIR=("$HOME/metis-repo/x86_64/")

Cleanup() {
        cd "$PKGDIR" || exit
        rm -rf metis.db* metis.files* 
        cd ../
        echo -e "[*] Repo cleaned successfully [*]"
}

gitadd() {
    git add --all
    read -p "Enter commit message: " commitmsg 
    git commit -m "$commitmsg"
    git push --force
    echo -e "[*] Added all pkgs to Repo [*]\n"
}

updaterepo() {
    cd "$PKGDIR" || exit
    repo-add -n -R metis.db.tar.gz *.pkg.tar.zst*
    cd ../
    echo -e "[*] Repo updated successfully [*]"
    echo -e "\n"
}

Usages() {
            cat <<- EOF
		Usage : `basename $0` [-c] [-u] [-g ]
		Options:
		        -h          Show this help message
		        -u          Update Repo
		        -g          Add files to github repo.
        -c          Clean current repo 

To add Metis repo first create a zst archive of the file and do -c -u -g 
respectively to add in the repository.

EOF

}
# getopts implementation for arguments

while getopts 'cugh' OPTION; do
  case "$OPTION" in 
    c) 
      Cleanup ;;

    u)
      updaterepo ;;
      
    g) 
        gitadd ;;

    h) 
        Usages ;;

    ?) 
      exit 1
      ;;
  esac
done
