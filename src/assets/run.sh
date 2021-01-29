#!/bin/sh 

dotnet build $SOLUTION_FILE_PATH 
shopt -s globstar
cp -r ./**/*.roslyn.json /artifacts