# metis-andromeda
Andromeda: System pkgs for @metis-os


Setup:

Add the following line to your `/etc/pacman.conf`
```bash
[andromeda]
SigLevel = Optional TrustAll
Include = /etc/pacman.d/metis-andromeda
```
and add the server adress to `/etc/pacman.d/metis-andromeda`

```
Server = https://metis-os.github.io/repo-andromeda/$repo/os/$arch
```
