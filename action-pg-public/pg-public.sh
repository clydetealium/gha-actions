#!/bin/bash

# Use git diff to get the changes and filter the filenames containing 'defaultSchemaName'
changed_files=$(git diff --name-only --diff-filter=ACMRTUXB -- '*.sql' | xargs grep -l 'defaultSchemaName')

# Iterate through the changed files and find the lines with the specific string
for file in $changed_files; do
    echo "Changes in $file:"
    git diff --unified=0 -- $file | grep -n 'defaultSchemaName' | awk -F ':' '{print $1 ":" $3}'
done

echo "Done"
