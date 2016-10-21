#Purpose:Search all .git and show commit information
#!/bin/sh
CUR_DIR=`pwd`

function get_project_path()
{
    git remote -v | head -n1 | awk '{print $2}' | sed 's/ssh:\/\/.*@.*:[0-9]*\///'
}

function get_git_version()
{
    git rev-parse HEAD
}

#Switch to $1(folder name) & print
function print_all()
{
    cd $CUR_DIR && cd $1 && TMP_VER=`get_git_version` && TMP_VER+=" @ " && TMP_VER+=`get_project_path` && echo $TMP_VER
}

#Find all .git folder
gitfolder=`find . -type d -name .git`
for i in $gitfolder
do
    target_folder=`dirname $i`
    print_all $target_folder
done
