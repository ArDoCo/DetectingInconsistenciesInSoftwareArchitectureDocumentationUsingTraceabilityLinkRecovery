#!/bin/bash
PWD=$(pwd)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ "$PWD" != "$DIR" ]
then
        echo "This script does not support execution from other directories"
        exit 1
fi

git subtree pull --prefix benchmark https://github.com/ArDoCo/Benchmark main --squash
git subtree pull --prefix tlr-baseline https://github.com/ArDoCo/SimpleTracelinkDiscovery main --squash