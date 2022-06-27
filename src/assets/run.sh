#!/bin/sh 

dotnet build $SOLUTION_FILE_PATH -property:NoWarn=""

shopt -s globstar
cp -r ./**/*.roslyn.json /artifacts