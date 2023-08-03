#!/bin/sh
FROM_REF=${INPUT_FROM:-origin/master}
TO_REF=${INPUT_TO:-HEAD}
FILE_MATCH='liquibase.properties'
UPDATE_MATCH='defaultSchemaName:public'

printf "Checking for the use of 'public' as the default schema name...\n"

changed_files=$(git diff \
  --name-only --diff-filter=ACMRTUXB "${FROM_REF}" "${TO_REF}" |\
  grep "${FILE_MATCH}" | uniq)

printf "\n${FILE_MATCH} files with updates matching '${UPDATE_MATCH}':\n$changed_files\n\n"
# Iterate through the changed files and find the lines with the specific string
for file in $changed_files; do
  printf "\n'${UPDATE_MATCH}' found in file:\n $file \nas a result of this diff:\n\n$(git diff --unified=0 "${FROM_REF}" "${TO_REF}" $file)\n\n"
done

if [ -n "$changed_files" ]; then
  printf "\nThe above files contain the string '${UPDATE_MATCH}'.\nThe use of 'public' as the default schema is not allowed.\n"
  exit 1
else
  printf "\nNo files contain the string ${UPDATE_MATCH}.\n"
  exit 0
fi
