#!/usr/bin/env bash

init () {
    git add --all .
}

commit_msg () {
    echo "
       /\_/\  +                             +
  /\  / o o \ [ Enter your commit message ! ]
 //\\\\ \~(*)~/ +                             +
 \`  \/   ^ /
    | \|| ||
    \ '|| ||
     \)()-())
    "
}

final () {
    read input
    git commit -m "$input"
    git push origin
}

init
commit_msg
final
