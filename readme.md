How to run the organize script:
1) change the permissions 
chmod +x organize.sh
2) find the path of the folder you want to organize 
./organize.sh directory_path

was inspired by this article :
https://dev.to/w3ndo/basic-bash-automation-a-script-to-organize-my-downloads-folder-44e3

I added: 
- code to go through first level subdirectories and organize them
- code to check if the folder we are in is part of the folders in the array , if yes we assume we don't need to organize it further

