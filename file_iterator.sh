#!/bin/bash

blamed_file="/home/shamanyu/codes/author_commit_count/blamed_file.txt"

declare -a file_types=("*.erl" "*.py" "*.c" "*.sh" "*.rb" "*.html" "*.css" "*.js" "*.jsx" "*.yml")

declare -a repositories=("/home/shamanyu/workspace/ButlerServer/butler_server" "/home/shamanyu/workspace/ButlerRemote/butler_remote" "/home/shamanyu/workspace/ButlerInterfaceUI/butlerui" "/home/shamanyu/workspace/BarcodeGenerator/barcode-generator-ii" "/home/shamanyu/workspace/butler_interface" "/home/shamanyu/workspace/ButlerInstallationScripts/butler_installation_scripts" "/home/shamanyu/workspace/mapcreator" "/home/shamanyu/workspace/manager_dashboard") 

declare -a test=("/home/shamanyu/workspace/butler_interface")

rm $blamed_file

for repository in "${repositories[@]}"
do
    cd $repository
    for file_type in "${file_types[@]}"
    do
        echo "Adding to blamed file $blamed_file for file_type $file_type in repository $repository"
        find -name $file_type -exec git blame {} >> $blamed_file \;
    done
done

