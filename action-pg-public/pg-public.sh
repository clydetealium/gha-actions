#!/bin/bash
FILE_MATCH='liquibase.properties'
UPDATE_MATCH='defaultSchemaName'

# Use git diff to get the changes and filter the filenames containing 'defaultSchemaName'
changed_files=$(git diff --name-only --diff-filter=ACMRTUXB -- "${FILE_MATCH}" | xargs grep -l 'defaultSchemaName')

# Iterate through the changed files and find the lines with the specific string
for file in $changed_files; do
    echo "Changes in $file:"
    git diff --unified=0 -- $file | grep -n "${UPDATE_MATCH}" | awk -F ':' '{print $1 ":" $3}'
done

echo 'all clear'
