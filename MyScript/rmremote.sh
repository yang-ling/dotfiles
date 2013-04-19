#!/bin/bash
cd ~/EclipseWorkspace/workspace-clm-core/clm-core/
ALL_LOCAL_BRANCH="master develop"
ALL_REMOTE_BRANCH=`git branch -r`
PREFIX="origin/"
for onebranch in $ALL_REMOTE_BRANCH;do
    exist=false
    for onelocal in $ALL_LOCAL_BRANCH;do
        if [ "$PREFIX$onelocal" = "$onebranch" ];then
            exist=true
            break
        fi
    done
    if ! $exist ; then
        echo $onebranch" will be removed!"
        if [ -z "$1" ]; then
            git branch -rd $onebranch
            echo $onebranch" has been removed!"
        fi
    fi
done
