#!/bin/bash
#
##################################################################################################################
# Author 	: 	Nabeen Tiwaree
# Website 	: 	https://iyammabeen.xyz
##################################################################################################################

git pull

# Below command will backup everything inside the project folder
git add --all .

# Give a comment to the commit if you want
echo "####################################"
echo "Write your commit comment!"
echo "####################################"

input="new icons"
git commit -m "Comment : $input "

git push -u origin master


echo "################################################################"
echo "###################    Git Push Done      ######################"
echo "################################################################"
